//
//  AlaphabetItem.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Foundation

struct AlaphabetItem: Identifiable {
    let prefix: String
    var items: [CredentialItem]
    
    var id: String {
        prefix
    }
}
