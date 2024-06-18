//
//  CredentialItem.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

protocol CredentialItem {
    var id: UUID { get }
    var title: String { get set }
    var memo: String { get set }
    var symbolString: String { get set }
    var symbolColor: Color { get set }
    var images: [UIImage] { get set }
    var isPinned: Bool { get set }
}

extension CredentialItem {
    
    var prefix: String {
        if self.title.startsWithKorean {
            return self.title.chosung
        } else if self.title.startsWithEnglish {
            return self.title.first?.lowercased() ?? ""
        } else {
            return ""
        }
    }
}
