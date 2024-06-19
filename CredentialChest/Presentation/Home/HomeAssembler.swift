//
//  HomeAssembler.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation

final class HomeAssembler {
    
    func resolve() -> HomeViewModel {
        return HomeViewModel(credentialItemUseCase: resolve())
    }
    
    func resolve() -> CredentialItemUseCase {
        return CredentialItemUseCase(repository: resolve())
    }
    
    func resolve() -> BasicCredentialItemRepository {
        return BasicCredentialItemRepository()
    }
}
