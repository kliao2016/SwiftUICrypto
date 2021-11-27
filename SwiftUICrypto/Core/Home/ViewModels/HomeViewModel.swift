//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/26/21.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService: CoinDataService
    
    init(dataService: CoinDataService = CoinDataService()) {
        self.dataService = dataService
        subscribeToDataService()
    }
    
    private func subscribeToDataService() {
        dataService.$allCoins
            .sink { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellables)
    }
    
}
