//
//  Date.swift
//  Crypto
//
//  Created by MyBook on 15.06.2022.
//

import Foundation

extension Date {
    
    //2022-06-14T07:50:48.804Z
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        shortFormatter.string(from: self)
    }
}
