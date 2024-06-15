//
//  String+Extension.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
}
