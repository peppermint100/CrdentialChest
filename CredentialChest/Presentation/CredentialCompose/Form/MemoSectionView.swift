//
//  MemoSectionView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI

struct MemoSectionView: View {
    
    @Binding var text: String
    
    var body: some View {
        Section(header: Text("Memo".localized)) {
            ZStack(alignment: .leading) {
                TextEditor(text: $text)
                    .overlay(alignment: .topLeading) {
                        if text == "" {
                            Text("Add Memo".localized)
                                .foregroundColor(.gray.opacity(0.45))
                                .offset(x: 3, y: 6)
                        }
                    }
                    .frame(height: 150)
            }
        }
    }
}

#Preview {
    MemoSectionView(text: .constant(""))
}
