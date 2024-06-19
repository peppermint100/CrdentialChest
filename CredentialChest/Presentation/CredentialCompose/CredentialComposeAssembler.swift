//
//  CredentialComposeAssembler.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import Foundation

final class CredentialComposeAssembler {
    
    func resolve() -> CredentialItemUseCase {
        return CredentialItemUseCase(repository: resolve())
    }
    
    func resolve() -> BasicCredentialItemRepository {
        return BasicCredentialItemRepository()
    }
    
    func resolve(item: BasicCredentialItem) -> BasicCredentialItemComposeViewModel {
        return BasicCredentialItemComposeViewModel(item: item, useCase: resolve())
    }
}
