//
//  String.swift
//  Crypto
//
//  Created by MyBook on 12.06.2022.
//

import Foundation

extension String {
    /// Replace "," to "."
    /// ```
    /// Convert "1,2" to "1.2"
    /// ```
    var replaceCommaWithDot: String {
        self.replacingOccurrences(of: ",", with: ".", options: .regularExpression)
    }
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
