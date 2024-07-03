//
//  ImageLoader.swift
//  Crypto
//
//  Created by MyBook on 01.06.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoader: View {
    
    var url: String
    
    var body: some View {
        SDWebImageLoader(url: url)
    }
}

struct SDWebImageLoader: View {
    
    var url: String
    
    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
        } placeholder: {
            EmptyView()
        }
        .onSuccess { image, data, cacheType in
            // Success
            // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
        }
        .indicator(.activity) // Activity Indicator
        .transition(.fade(duration: 0.5)) // Fade Transition with duration
        .scaledToFit()
    }
}

#Preview {
    SDWebImageLoader(url: "https://dummyimage.com/300")
}
