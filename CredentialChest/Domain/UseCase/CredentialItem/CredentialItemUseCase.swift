//
//  CredentialItemUseCase.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Foundation

struct CredentialItemUseCase {
    let repository: BasicCredentialItemRepository
}

extension CredentialItemUseCase {
    
    func add(_ item: CredentialItem) {
        repository.insert(item)
    }
    
    func fetch() -> [CredentialItem] {
        return repository.fetch()
    }
}
