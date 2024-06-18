//
//  CredentialItemUseCase.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Foundation

struct CredentialItemUseCase {
    let repository: CredentialItemRepository
}

extension CredentialItemUseCase {
    
    func add(_ item: BasicCredentialItem) {
        repository.insert(item)
    }
    
    func fetch() -> [CredentialItem] {
        return repository.fetch()
    }
}
