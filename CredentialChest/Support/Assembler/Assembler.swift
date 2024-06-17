//
//  Assembler.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation

protocol Assembler: AnyObject,
                    HomeAssembler
                    {
}

final class DefaultAssembler: Assembler {
}
