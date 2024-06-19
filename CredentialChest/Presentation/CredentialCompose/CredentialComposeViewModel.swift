//
//  CredentialComposeViewModel.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI
import PhotosUI

protocol CredentialComposeViewModel {
    func bind() -> Void
    func changeIcon(_ icon: CredentialItemIcon)
    func changeIconColor(_ color: Color)
    func removeImage(at id: UUID)
}

extension CredentialComposeViewModel {
    
    var icons: [CredentialItemIcon] {
        CredentialItemConstants.credentialItemIcons
    }
    var iconColors: [Color] {
        CredentialItemConstants.credentialItemIconColors
    }
    
    var navigationTitle: String {
        "New Credential".localized
    }
}
