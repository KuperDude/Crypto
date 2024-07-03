//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by MyBook on 10.06.2022.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @MainActor @Published var image: UIImage?
    @Published var isLoading = false
    
    let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        getImage()
        self.isLoading = true
    }
    
    private func getImage() {
        Task {
            for await returnedImage in dataService.$image.values {
                await MainActor.run {
                    self.image = returnedImage
                }
                break
            }
        }
    }
}
