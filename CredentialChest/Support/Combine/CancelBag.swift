//
//  CancelBag.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import Combine

open class CancelBag {
    public var cancellables = Set<AnyCancellable>()
    
    public func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}

extension AnyCancellable {
    public func store(in cancelBag: CancelBag) {
        cancelBag.cancellables.insert(self)
    }
}
