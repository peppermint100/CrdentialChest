//
//  CredentialItemConstants.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/18/24.
//

import SwiftUI

struct CredentialItemIcon: Identifiable {
    let id: String
    let icon: Image
    
    init(id: String, icon: Image) {
        self.id = id
        self.icon = icon
    }
    
    init(symbolString: String) {
        self.id = symbolString
        self.icon = Image(systemName: symbolString)
    }
}

enum CredentialItemConstants {
        
    static let credentialItemIcons = [
        CredentialItemIcon(id: "lock", icon: Symbols.lock),
        CredentialItemIcon(id: "lock.fill", icon: Symbols.lockFill),
        CredentialItemIcon(id: "lock.circle", icon: Symbols.lockCircle),
        CredentialItemIcon(id: "lock.circle.fill", icon: Symbols.lockCircleFill),
        CredentialItemIcon(id: "key", icon: Symbols.key),
        CredentialItemIcon(id: "key.fill", icon: Symbols.keyFill),
        CredentialItemIcon(id: "airplane", icon: Symbols.airplane),
        CredentialItemIcon(id: "airplane.fill", icon: Symbols.airplaneDeparture),
        CredentialItemIcon(id: "person", icon: Symbols.person),
        CredentialItemIcon(id: "person.fill", icon: Symbols.personFill),
        CredentialItemIcon(id: "doc.text", icon: Symbols.docText),
        CredentialItemIcon(id: "doc.text.fill", icon: Symbols.docTextFill),
        CredentialItemIcon(id: "creditcard", icon: Symbols.creditcard),
        CredentialItemIcon(id: "creditcard.fill", icon: Symbols.creditcardFill),
        CredentialItemIcon(id: "creditcard.circle", icon: Symbols.creditcardCircle),
        CredentialItemIcon(id: "creditcard.circle.fill", icon: Symbols.creditcardCircleFill),
        CredentialItemIcon(id: "house", icon: Symbols.house),
        CredentialItemIcon(id: "house.fill", icon: Symbols.houseFill),
        CredentialItemIcon(id: "mappin", icon: Symbols.mappin),
        CredentialItemIcon(id: "mappin.circle", icon: Symbols.mappinCircle),
        CredentialItemIcon(id: "dollarsign.circle", icon: Symbols.dollarsignCircle),
        CredentialItemIcon(id: "dollarsign.circle.fill", icon: Symbols.dollarsignCircleFill),
        CredentialItemIcon(id: "banknote", icon: Symbols.banknote),
        CredentialItemIcon(id: "banknote.fill", icon: Symbols.banknoteFill),
        CredentialItemIcon(id: "number.circle", icon: Symbols.numberCircle),
        CredentialItemIcon(id: "number.circle.fill", icon: Symbols.numberCircleFill)
    ]

    
    static let credentialItemIconColors = [
        Color.blue, Color.orange, Color.yellow, Color.green, Color.red, Color.gray, Color.brown, Color.indigo,
        Color.mint, Color.teal, Color.pink, Color.cyan
    ]
}
