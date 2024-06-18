//
//  BasicCredentialItemEntity+CoreDataProperties.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//
//

import Foundation
import CoreData


extension BasicCredentialItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasicCredentialItemEntity> {
        return NSFetchRequest<BasicCredentialItemEntity>(entityName: "BasicCredentialItemEntity")
    }

    @NSManaged public var password: String?

}
