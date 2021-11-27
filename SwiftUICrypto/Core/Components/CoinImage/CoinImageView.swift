//
//  CoinImageView.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/27/21.
//

import SwiftUI
import Combine

final class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let coinImageService: CoinImageService
    
    init(coin: Coin) {
        self.coinImageService = CoinImageService(coin: coin)
        self.isLoading = true
        subscribeToImageService()
    }
    
    private func subscribeToImageService() {
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}

struct CoinImageView: View {
    @ObservedObject var vm: CoinImageViewModel
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(vm: CoinImageViewModel(coin: dev.coin))
    }
}
