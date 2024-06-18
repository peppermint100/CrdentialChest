//
//  AddCredentialView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/17/24.
//

import SwiftUI

struct CredentialComposeView: View {
    var body: some View {
        ZStack {
            Color.systemBackground
            NavigationStack {
                Text("Compose")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            let usecase = CredentialItemUseCase(repository: BasicCredentialItemRepository())
                            usecase.add(
                                BasicCredentialItem(
                                    id: UUID(), title: "집 비밀번호", memo: "집 공동 현관 비밀번호", symbolString: "gear",
                                    symbolColor: Color.blue, images: [], isPinned: true, password: "123123")
                            )
                        }, label: {
                            Text("완료")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    CredentialComposeView()
}
