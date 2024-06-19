//
//  SymbolIconRectangleImageView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/18/24.
//

import SwiftUI

struct SymbolIconRectangleImageView: View {
    let symbol: Image
    let color: Color
    let size: CGFloat
    
    init(symbol: Image, color: Color, size: CGFloat = 40) {
        self.symbol = symbol
        self.color = color
        self.size = size
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size / 5)
                .fill(color)
                .frame(width: size, height: size)
            
            symbol
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: size * 0.7, height: size * 0.7)
        }
    }
}

#Preview {
    SymbolIconRectangleImageView(symbol: Symbols.dollarsignCircle, color: Color.blue)
}
