//
//  HomeRouter.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

class HomeRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    let assembler: HomeAssembler = DefaultAssembler()
    
    enum Page: Hashable {
        case root
        case detail(CredentialItem)
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
        }
        
        static func == (lhs: Page, rhs: Page) -> Bool {
            switch (lhs, rhs) {
            case let (.detail(lhsItem), .detail(rhsItem)):
                return lhsItem.id == rhsItem.id
            default:
                return true
            }
        }
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .root:
            HomeView(vm: assembler.resolve())
                .environmentObject(self)
        case .detail(let item):
            Text(item.title)
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
}
