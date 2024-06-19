//
//  PhotoPickerSelectedImageView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/18/24.
//

import SwiftUI

struct PhotoPickerSelectedImageView: View {
    
    let image: UIImage
    let onTapGesture: () -> Void
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .overlay(alignment: .topLeading) {
                Symbols.xMarkCircleFill
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.palette)
                    .frame(width: 20 ,height: 20)
                    .offset(x: 5, y: 5)
                    .foregroundStyle(Color.white, Color.red)
                    .onTapGesture {
                        onTapGesture()
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PhotoPickerSelectedImageView(image: UIImage(named: "testImage")!, onTapGesture: {})
        .frame(width: 100, height: 100)
}
