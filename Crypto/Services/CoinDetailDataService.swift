//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by MyBook on 14.06.2022.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel?
    
    private var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        Task {
            guard let data = try? await NetworkingManager.download(url: url) else { return }
            
            let coinDetails = try JSONDecoder().decode(CoinDetailModel.self, from: data)
            
            await MainActor.run {
                self.coinDetails = coinDetails
            }
        }
    }
}
