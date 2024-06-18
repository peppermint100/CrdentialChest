//
//  CredentialItemRepository.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Foundation

protocol CredentialItemRepository {
    func insert(_ item: CredentialItem)
    func fetch() -> [CredentialItem]
}
