//
//  HomeView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @ObservedObject private var vm: HomeViewModel
    
    init(vm: HomeViewModel) {
        self.vm = vm
        vm.getItems()
    }
    
    var body: some View {
        ZStack {
            Color.systemBackground
                .ignoresSafeArea()
            
            NavigationStack(path: $router.path) {
                GeometryReader { geo in
                    List {
                        ForEach(vm.categorizedCredentials) { credentials in
                            if !credentials.items.isEmpty {
                                Section(header: Text(credentials.prefix)) {
                                    ForEach(credentials.items, id: \.id) { item in
                                        CredentialItemRowView(item: item)
                                            .onTapGesture {
                                                router.push(.detail(item))
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: HomeRouter.Page.self) { page in
                    router.build(page)
                }
            }
        }
    }
}

#Preview {
    HomeRouter().build(.root)
        .environmentObject(HomeRouter())
}
