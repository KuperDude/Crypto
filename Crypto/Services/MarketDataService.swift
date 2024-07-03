//
//  MarketDataService.swift
//  Crypto
//
//  Created by MyBook on 11.06.2022.
//

import SwiftUI
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel?
    
    private var marketDataSubscription: AnyCancellable?
    
    init() {
        Task {
            try await getData()
        }
    }
    
    func getData() async throws {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        
        guard let data = try? await NetworkingManager.download(url: url) else { return }
        
        let globalData = try JSONDecoder().decode(GlobalData.self, from: data)
        
        await MainActor.run {
            marketData = globalData.data
        }
        
    }
}
