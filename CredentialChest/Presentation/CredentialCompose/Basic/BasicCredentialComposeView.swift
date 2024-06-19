//
//  AddCredentialView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import SwiftUI
import PhotosUI

struct BasicCredentialComposeView: View {
    
    @ObservedObject var vm: BasicCredentialItemComposeViewModel
    @EnvironmentObject var router: HomeRouter
    
    var body: some View {
        ZStack {
            Color.systemBackground
            GeometryReader { geo in
                NavigationStack {
                    Form {
                        TitleSectionView(
                            text: $vm.item.title,
                            icon: Image(systemName: vm.item.symbolString),
                            iconColor: vm.item.symbolColor) {
                                vm.showIconModifier.toggle()
                            }
                        
                        if vm.showIconModifier {
                            IconModifierSectionView(
                                onChangeIcon: { icon in vm.changeIcon(icon) },
                                onChangeColor: { color in vm.changeIconColor(color) })
                        }
                        
                        Section {
                            SecuredTextFieldView(placeholder: "Enter Your Credential Here".localized, text: $vm.item.password)
                            PinToggleView(isPinned: $vm.item.isPinned)
                        }
                        .padding(.vertical, 3)
                        
                        MemoSectionView(text: $vm.item.memo)
                        
                        PhotoPickerView(imageSelection: $vm.imageSelection, selectedImages: $vm.selectedImages)
                        
                        if !vm.selectedImages.isEmpty {
                            ScrollView(.horizontal) {
                                HStack(spacing: 15) {
                                    ForEach(vm.selectedImages) { imageItem in
                                        PhotoPickerSelectedImageView(image: imageItem.image) {
                                            vm.removeImage(at: imageItem.id)
                                        }
                                        .frame(width: geo.size.width / 3 - 40, height: geo.size.width / 3 - 40)
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                    }
                    .listSectionSpacing(15)
                    .navigationTitle(vm.navigationTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            completeButton
                        }
                    }
                }
            }
        }
    }
}

private extension BasicCredentialComposeView {
    
    var completeButton: some View {
        Button(action: {
            vm.onTapCompleteButton()
            router.dismiss()
        }, label: {
            Text("Complete".localized)
        })
    }
}

#Preview {
    BasicCredentialComposeView(
        vm: CredentialComposeAssembler().resolve(
            item: PreviewMockData.basicCredentialItem)
    )
}
