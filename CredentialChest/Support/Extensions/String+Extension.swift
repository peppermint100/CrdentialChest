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
    
    var startsWithKorean: Bool {
        guard let firstScalar = self.unicodeScalars.first else {
            return false
        }
        
        return CharacterSet(charactersIn: "ㄱ"..."힣").contains(firstScalar)
    }
    
    var startsWithEnglish: Bool {
        guard let firstScalar = self.unicodeScalars.first else {
            return false
        }
        
        return (firstScalar >= "\u{0041}" && firstScalar <= "\u{007A}") || (firstScalar >= "\u{00C0}" && firstScalar <= "\u{00FF}")
    }
}

extension String {
    var chosung: String {
        guard let firstCharacter = self.first else {
            return AlaphabetSupport.etc
        }
        
        let unicodeValue = firstCharacter.unicodeScalars.first!.value
        
        if unicodeValue >= 0xAC00 && unicodeValue <= 0xD7A3 {
            let index = (unicodeValue - 0xAC00) / 28 / 21
            return AlaphabetSupport.alphabetKo[Int(index)]
        }
        
        return AlaphabetSupport.etc
    }
}
