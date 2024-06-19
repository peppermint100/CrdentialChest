//
//  IconModifierView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI

struct IconModifierSectionView: View {
    
    let icons: [CredentialItemIcon] = CredentialItemConstants.credentialItemIcons
    let colors: [Color] = CredentialItemConstants.credentialItemIconColors
    var onChangeIcon: (_ icon: CredentialItemIcon) -> Void
    var onChangeColor: (_ color: Color) -> Void
    
    let columns: [GridItem] = Array(
        repeating: .init(.flexible(minimum: 45, maximum: 45)),
        count: 6)
    
    var body: some View {
        Section {
            iconSelector
            iconColorSelector
        }
        .padding()
    }
}

#Preview {
    Form {
        IconModifierSectionView(
            onChangeIcon: { _ in },
            onChangeColor: { _ in }
        )
    }
}

private extension IconModifierSectionView {
    var iconSelector: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(icons) { icon in
                SymbolIconImageView(symbol: icon.icon, color: Color.gray)
                    .onTapGesture {
                        onChangeIcon(icon)
                    }
            }
        }
    }
    
    var iconColorSelector: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .onTapGesture {
                        onChangeColor(color)
                    }
            }
        }
    }
}
