//
//  PasswordTextFieldView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/19/24.
//

import SwiftUI

struct SecuredTextFieldView: View {
    
    var placeholder: String
    @Binding var text: String
    
    @State private var isSecured: Bool = true
    
    var body: some View {
        HStack {
            SymbolIconRectangleImageView(symbol: Symbols.keyFill, color: Color.black, size: 30)
            
            if isSecured {
                SecureField(placeholder, text: $text)
                    .foregroundStyle(Color.secondaryLabel)
                secureButton
            } else {
                TextField(placeholder, text: $text)
                    .foregroundStyle(Color.secondaryLabel)
                secureButton
            }
        }
    }
}

private extension SecuredTextFieldView {
    var secureButton: some View {
        SymbolIconImageView(
            symbol: isSecured ? Symbols.eye: Symbols.eyeSlash,
            color: isSecured ? Color.gray.opacity(0.7) : Color.black,
            circleSize: 20)
        .onTapGesture(perform: {
            isSecured.toggle()
        })
    }
}

#Preview {
    Form {
        SecuredTextFieldView(placeholder: "비밀번호를 입력해주세요.", text: .constant("123123"))
    }
}
