//
//  HomeAssembler.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeViewModel
    func resolve() -> CredentialItemUseCase
    func resolve() -> CredentialItemRepository
}

extension HomeAssembler {
    
    func resolve() -> HomeViewModel {
        return HomeViewModel(credentialItemUseCase: resolve())
    }
    
    func resolve() -> CredentialItemUseCase {
        return CredentialItemUseCase(repository: resolve())
    }
    
    func resolve() -> CredentialItemRepository {
        return BasicCredentialItemRepository()
    }
}
