//
//  SymbolIconImageView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/18/24.
//

import SwiftUI

struct SymbolIconImageView: View {
    
    let symbol: Image
    let color: Color
    let circleSize: CGFloat
    
    init(symbol: Image, color: Color, circleSize: CGFloat = 40) {
        self.symbol = symbol
        self.color = color
        self.circleSize = circleSize
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: circleSize, height: circleSize)
            
            symbol
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: circleSize * 0.7, height: circleSize * 0.7)
        }
    }
}

#Preview {
    Group {
        SymbolIconImageView(symbol: Symbols.plus, color: Color.blue)
        SymbolIconImageView(symbol: Symbols.airplaneDeparture, color: Color.blue)
        SymbolIconImageView(symbol: Symbols.creditcardCircle, color: Color.blue)
        SymbolIconImageView(symbol: Symbols.dollarsignCircle, color: Color.blue)
    }
}
