//
//  PinToggleView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI

struct PinToggleView: View {
    
    @Binding var isPinned: Bool
    
    var body: some View {
        Toggle(isOn: $isPinned, label: {
            HStack {
                SymbolIconRectangleImageView(symbol: Symbols.pin, color: .orange, size: 30)
                Text("Pin To Top".localized)
            }
        })
    }
}

#Preview {
    Form {
        PinToggleView(isPinned: .constant(true))
    }
}
