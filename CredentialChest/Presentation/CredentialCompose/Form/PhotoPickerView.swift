//
//  PhotoPickerView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @Binding var imageSelection: PhotosPickerItem?
    @Binding var selectedImages: [ImageModel]
    
    var body: some View {
        Section {
            PhotosPicker(selection: $imageSelection, matching: .images) {
                HStack(spacing: 1) {
                    Text("Add Image".localized)
                    
                    if selectedImages.count > 0 {
                        Text("(\(selectedImages.count))")
                    }
                }
                .foregroundStyle(Color.blue)
            }
        }
    }
}

#Preview {
    Form {
        GeometryReader { geo in
            PhotoPickerView(
                imageSelection: .constant(nil), selectedImages: .constant([])
            )
        }
    }
}
