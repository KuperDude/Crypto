//
//  CoinDataService.swift
//  Crypto
//
//  Created by MyBook on 10.06.2022.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    private var coinSubscription: AnyCancellable?
    
    init() {
        Task {
            try await getCoins()
        }
    }
    
    func getCoins() async throws {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        guard let data = try? await NetworkingManager.download(url: url) else { return }
        
        let coins = try JSONDecoder().decode([CoinModel].self, from: data)
        
        await MainActor.run {
            allCoins = coins
        }
        
    }
}
