//
//  AlaphabetSupport.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/16/24.
//

import Foundation

enum AlaphabetSupport {
    
    static let alphabetEn = Array("abcdefghijklmnopqrstuvwxyz").map { String($0) }
    static let alphabetKo: [String] = [
        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ",
        "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
    ]
}

extension AlaphabetSupport {
    
    static func generateEmptyAlaphabetItems() -> [AlaphabetItem] {
        let alphabet = AlaphabetSupport.alphabetEn + AlaphabetSupport.alphabetKo + ["etc"]
        return alphabet.map {
            AlaphabetItem(prefix: $0, items: [])
        }
    }
}
