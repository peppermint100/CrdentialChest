//
//  CredentialComposeViewModel.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/18/24.
//

import SwiftUI
import PhotosUI
import Combine

final class BasicCredentialItemComposeViewModel: CredentialComposeViewModel, ObservableObject {
    @Published var item: BasicCredentialItem
    var useCase: CredentialItemUseCase
    
    private let cancelBag = CancelBag()
    
    init(item: CredentialItem, useCase: CredentialItemUseCase) {
        self.item = item as? BasicCredentialItem ?? BasicCredentialItem()
        self.useCase = useCase
        bind()
    }

    @Published var showIconModifier = false
    @Published var imageSelection: PhotosPickerItem?
    @Published var selectedImages: [ImageModel] = []
}

extension BasicCredentialItemComposeViewModel {
    
    func bind() {
        $imageSelection
            .sink { [weak self] selection in
                guard let self = self else { return }
                Task {
                    if let imageData = try? await selection?.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            DispatchQueue.main.async {
                                self.selectedImages.append(ImageModel(image: image))
                                self.item.images = self.selectedImages.map { $0.image }
                                self.imageSelection = nil
                            }
                        }
                    }
                }
            }
            .store(in: cancelBag)
    }
    
    func changeIcon(_ icon: CredentialItemIcon) {
        item.symbolString = icon.id
    }
    
    func changeIconColor(_ color: Color) {
        item.symbolColor = color
    }
    
    func removeImage(at id: UUID) {
        selectedImages.removeAll { $0.id == id }
    }
}

extension BasicCredentialItemComposeViewModel {
    
    func onTapCompleteButton() {
        useCase.add(item)
    }
}
