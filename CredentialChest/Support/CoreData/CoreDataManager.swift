//
//  CoreDataManager.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentCloudKitContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentCloudKitContainer(name: "CoreDataContainer")
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.loadPersistentStores(completionHandler: { description, error in
            if let error {
                print("Error serving coredata: ", error.localizedDescription)
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Context has successfully saved")
        } catch let error {
            print("Error saving data to coredata: ", error.localizedDescription)
        }
    }
}

