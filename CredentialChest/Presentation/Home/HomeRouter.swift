//
//  HomeRouter.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

class HomeRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    let assembler: HomeAssembler = HomeAssembler()
    
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
    
    enum Sheet: Identifiable {
        
        case compose(item: CredentialItem?)
        
        var id: String {
            switch self {
            case .compose(let item):
                return item?.id.uuidString ?? ""
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
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        let credentialAssembler = CredentialComposeAssembler()
        switch sheet {
        case .compose(let item):
            if let item = item as? BasicCredentialItem {
                BasicCredentialComposeView(vm: credentialAssembler.resolve(item: item))
                    .environmentObject(self)
            }
        }
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismiss() {
        self.sheet = nil
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
}
