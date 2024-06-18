//
//  CredentialItemEntity+CoreDataProperties.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//
//

import Foundation
import CoreData


extension CredentialItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CredentialItemEntity> {
        return NSFetchRequest<CredentialItemEntity>(entityName: "CredentialItemEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var memo: String?
    @NSManaged public var symbolString: String?
    @NSManaged public var r: Double
    @NSManaged public var g: Double
    @NSManaged public var b: Double
    @NSManaged public var a: Double
    @NSManaged public var isPinned: Bool
    @NSManaged public var images: NSSet?

}

// MARK: Generated accessors for images
extension CredentialItemEntity {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: CredentialItemImageEntity)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: CredentialItemImageEntity)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

extension CredentialItemEntity : Identifiable {

}
