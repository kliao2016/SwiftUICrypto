//
//  CoinDataService.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/26/21.
//

import Foundation
import Combine

final class CoinDataService {
    @Published var allCoins: [Coin] = []
    private var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: ServiceUrls.coinGeckoMarketApi) else { return }
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] coins in
                self?.allCoins = coins
                self?.coinSubscription?.cancel() // Cancel because this is a single GET request
            })
    }
}

private extension CoinDataService {
    enum ServiceUrls {
        static let coinGeckoMarketApi = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page1&sparkline=true&price_change_percentage=24h"
    }
}
