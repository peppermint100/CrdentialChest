//
//  CredentialItemImageEntity+CoreDataProperties.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//
//

import Foundation
import CoreData


extension CredentialItemImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CredentialItemImageEntity> {
        return NSFetchRequest<CredentialItemImageEntity>(entityName: "CredentialItemImageEntity")
    }

    @NSManaged public var image: Data?

}

extension CredentialItemImageEntity : Identifiable {

}
