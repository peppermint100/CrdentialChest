//
//  HomeViewModel.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var categorizedCredentials: [AlaphabetItem] = []
    
    func getItems() {
        let itemsInDB = PreviewMockData.credentialItems
        var sortedItems = AlaphabetSupport.generateEmptyAlaphabetItems()
        
        for item in itemsInDB {
            let prefix = item.prefix
            if let index = sortedItems.firstIndex(where: { $0.prefix == prefix }) {
                sortedItems[index].items.append(item)
            } else {
                sortedItems[sortedItems.count - 1].items.append(item)
            }
        }
        
        categorizedCredentials = sortedItems
    }
}
