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
    @Published var iCloudAllowed = false
    
    private let cancelBag = CancelBag()
    
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
    
    private func requestiCloudPermission() {
        CloudKitUtility.requestApplicationPermission()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self?.iCloudAllowed = false
                }
            } receiveValue: { [weak self] success in
                if success {
                    self?.iCloudAllowed = true
                    self?.getItems()
                } else {
                    self?.iCloudAllowed = false
                }
            }
            .store(in: cancelBag)
    }
    
    func getiCloudStatus() {
        CloudKitUtility.getiCloudStatus()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self?.requestiCloudPermission()
                }
            } receiveValue: { [weak self] success in
                if success {
                    self?.iCloudAllowed = true
                    self?.getItems()
                }
            }
            .store(in: cancelBag)
    }
}
