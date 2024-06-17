//
//  HomeAssembler.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeViewModel
}

extension HomeAssembler {
    
    func resolve() -> HomeViewModel {
        return HomeViewModel()
    }
}
