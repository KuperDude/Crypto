//
//  CoinImageService.swift
//  Crypto
//
//  Created by MyBook on 10.06.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        Task {
            if let savedImage = await fileManager.getImage(imageName: imageName, folderName: folderName) {
                image = savedImage
            } else {
                try? await downloadCoinImage()
            }
        }
    }
    
//    private func downloadCoinImage() {
//        guard let url = URL(string: coin.image) else { return }
//        
//        imageSubscription = NetworkingManager.download(url: url)
//            .tryMap({ data -> UIImage? in
//                return UIImage(data: data)
//            })
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedImage in
//                guard let self = self, let downloadImage = returnedImage else { return }
//                self.image = downloadImage
//                self.imageSubscription?.cancel()
//                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
//            }
//    }
    
    private func downloadCoinImage() async throws {
        guard let url = URL(string: coin.image) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let downloadImage = UIImage(data: data) else { return }
            await self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            await MainActor.run {
                self.image = downloadImage
            }
        } catch let error {
            throw error
        }
    }
}
