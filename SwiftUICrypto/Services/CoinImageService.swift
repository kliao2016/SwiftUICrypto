//
//  CoinImageService.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/27/21.
//

import Foundation
import Combine
import UIKit

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private lazy var fileManager = LocalFileManager.shared
    
    private let folderName = "coin_images"
    private let coin: Coin
    private lazy var imageName = coin.id
    
    init(coin: Coin) {
        self.coin = coin
        loadCoinImage()
    }
    
    private func loadCoinImage() {
        if let image = fileManager.image(withName: imageName, atFolder: folderName) {
            self.image = image
        } else {
            downloadCoinImage(withURL: coin.image)
        }
    }
    
    private func downloadCoinImage(withURL url: String) {
        guard let url = URL(string: url) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] image in
                guard let self = self, let downloadedImage = image else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel() // Cancel because this is a single GET request
                self.fileManager.saveImage(image: downloadedImage, withName: self.imageName, toFolder: self.folderName)
            })
    }
}
