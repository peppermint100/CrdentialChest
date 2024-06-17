//
//  CredentialItemRowView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

struct CredentialItemRowView: View {
    
    let item: CredentialItem
    
    var body: some View {
        GeometryReader { geo in
            let iconSize: CGFloat = 40
            
            HStack(alignment: .center) {
                icon
                    .frame(width: iconSize, height: iconSize)
                    .padding(.trailing, 8)
                
                Text(item.title)
                    .font(.subheadline)
                
                Spacer()
                
                if item.isPinned {
                    pin
                }
            }
        }
        .frame(height: 40)
    }
}

private extension CredentialItemRowView {
    var icon: some View {
        
        return Image(systemName: item.symbolString)
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.white)
            .padding(10)
            .background (
                item.symbolColor
            )
            .clipShape(Circle())
    }
    
    var pin: some View {
        Symbols.pinFill
            .foregroundStyle(Color.orange)
    }
}

#Preview {
    List {
        CredentialItemRowView(item: PreviewMockData.credentialItems[0])
        CredentialItemRowView(item: PreviewMockData.credentialItems[1])
        CredentialItemRowView(item: PreviewMockData.credentialItems[2])
        CredentialItemRowView(item: PreviewMockData.credentialItems[3])
    }
}
