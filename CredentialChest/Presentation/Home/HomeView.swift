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
        vm.getiCloudStatus()
    }
    
    var body: some View {
        ZStack {
            Color.systemBackground
                .ignoresSafeArea()
            
            GeometryReader { geo in
                if vm.iCloudAllowed {
                    NavigationStack(path: $router.path) {
                        credentials
                            .navigationDestination(for: HomeRouter.Page.self) { page in
                                router.build(page)
                            }
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    
                                    Menu {
                                        basicCompose
                                    } label: {
                                        Symbols.plus
                                    }
                                }
                            }
                            .sheet(item: $router.sheet, onDismiss: { vm.getItems() }) { sheet in
                                router.build(sheet)
                            }
                    }
                } else {
                    iCloudRefresh
                        .frame(width: geo.size.width)
                }
            }
        }
    }
}

#Preview {
    HomeRouter().build(.root)
        .environmentObject(HomeRouter())
}

private extension HomeView {
    
    var iCloudRefresh: some View {
        VStack {
            Spacer()
            Text("Check iCloud Status".localized)
                .font(.title3)
                .foregroundStyle(Color.secondaryLabel)
                .multilineTextAlignment(.center)
                .padding()
            Button(action: {
                vm.getiCloudStatus()
            }, label: {
                Symbols.arrowClockwise
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            })
            Spacer()
        }
        .padding()
    }
    
    var credentials: some View {
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
    
    var basicCompose: some View {
        Button(action: {
            router.present(.compose(item: BasicCredentialItem()))
        }, label: {
            Text("Basic".localized)
        })
    }
}
