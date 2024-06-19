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
    var images: [UIImage]
    var isPinned: Bool
    
    var password: String
    
    init(
        id: UUID = UUID(), title: String = "기본", memo: String = "기본 메모", symbolString: String = "airplane",
        symbolColor: Color = Color.blue, images: [UIImage] = [], isPinned: Bool = false,
        password: String = "") {
        self.id = id
        self.title = title
        self.memo = memo
        self.symbolString = symbolString
        self.symbolColor = symbolColor
        self.images = images
        self.isPinned = isPinned
        self.password = password
    }
    
    init?(from entity: BasicCredentialItemEntity) {
        let r = entity.r
        let g = entity.g
        let b = entity.b
        let a = entity.a
        let isPinned = entity.isPinned
        if let id = entity.id,
           let title = entity.title,
           let memo = entity.memo,
           let symbolString = entity.symbolString,
           let imagesData = entity.images,
           let password = entity.password {
            self.id = id
            self.title = title
            self.memo = memo
            self.symbolString = symbolString
            self.symbolColor = Color(red: r, green: g, blue: b, opacity: a)
            self.images = imagesData.compactMap { data in
                guard let imageData = data as? Data else { return nil }
                return UIImage(data: imageData)
            }
            self.isPinned = isPinned
            self.password = password
        } else {
            return nil
        }
    }
}
