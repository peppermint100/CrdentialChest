//
//  TitleTextFieldView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI

struct TitleSectionView: View {
    
    @Binding var text: String
    var icon: Image
    var iconColor: Color
    var onTapIcon: () -> Void
    
    var body: some View {
        
        Section(header: Text("Title".localized)) {
            HStack {
                SymbolIconImageView(symbol: icon, color: iconColor)
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            onTapIcon()
                        }
                    }
                TextField("Enter Title Here".localized, text: $text)
            }
        }
    }
}

#Preview {
    Form {
        TitleSectionView(
            text: .constant(""),
            icon: Symbols.airplaneDeparture,
            iconColor: Color.blue,
            onTapIcon: {}
        )
    }
}
