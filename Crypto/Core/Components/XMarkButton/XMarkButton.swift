//
//  XMarkButton.swift
//  Crypto
//
//  Created by MyBook on 12.06.2022.
//

import SwiftUI

struct XMarkButton: View {
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.headline)
            .padding(.vertical)
            .padding(.trailing, 20)
            .contentShape(Rectangle())
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
