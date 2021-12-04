//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/26/21.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var statistics: [Statistic] = [
        Statistic(title: "Title", value: "Value", percentageChange: 1),
        Statistic(title: "Title", value: "Value"),
        Statistic(title: "Title", value: "Value"),
        Statistic(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService: CoinDataService
    
    init(dataService: CoinDataService = CoinDataService()) {
        self.dataService = dataService
        subscribeToDataService()
    }
    
    private func subscribeToDataService() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map({ [weak self] (text, startingCoins) -> [Coin] in
                guard let self = self else { return [] }
                return self.filterCoins(text: text, coins: startingCoins)
            })
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
    }
    
}

private extension HomeViewModel {
    func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        let lowercasedText = text.lowercased()
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercasedText)
                || coin.symbol.lowercased().contains(lowercasedText)
                || coin.id.lowercased().contains(lowercasedText)
        }
    }
}
