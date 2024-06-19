//
//  BasicCredentialItemRepository.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import UIKit
import CoreData

struct BasicCredentialItemRepository: CredentialItemRepository {
    
    private let manager = CoreDataManager.shared
    
    func insert(_ item: CredentialItem) {
        if let item = item as? BasicCredentialItem {
            let newItem = BasicCredentialItemEntity(context: manager.context)
            newItem.id = item.id
            newItem.title = item.title
            newItem.memo = item.memo
            newItem.symbolString = item.symbolString
            newItem.isPinned = item.isPinned
            newItem.password = item.password
            
            item.images.forEach {
                let imageEntity = CredentialItemImageEntity(context: manager.context)
                imageEntity.image = $0.jpegData(compressionQuality: 1)
                newItem.addToImages(imageEntity)
            }
            
            newItem.r = item.symbolColor.components.red
            newItem.g = item.symbolColor.components.green
            newItem.b = item.symbolColor.components.blue
            newItem.a = item.symbolColor.components.opacity
            
            manager.save()
            print(newItem, " saved...")
        }
    }
    
    func fetch() -> [CredentialItem] {
        let request = NSFetchRequest<BasicCredentialItemEntity>(entityName: CoreDataEntity.basicCredentialItemEntityName)
        do {
            let entities = try manager.context.fetch(request)
            return entities.compactMap { BasicCredentialItem(from: $0) }
        } catch {
            print("Error Fetching Credential Item Data")
            return []
        }
    }
}
