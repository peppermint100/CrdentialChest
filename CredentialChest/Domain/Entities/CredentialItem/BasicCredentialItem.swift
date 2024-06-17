//
//  BasicCredentialItem.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

struct BasicCredentialItem: CredentialItem, Identifiable {
    let id: UUID
    var title: String
    var memo: String
    var symbolString: String
    var symbolColor: Color
    var images: [Image]
    var isPinned: Bool
    
    var password: String
}
