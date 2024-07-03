//
//  HapticManager.swift
//  Crypto
//
//  Created by MyBook on 13.06.2022.
//

import SwiftUI

actor HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
