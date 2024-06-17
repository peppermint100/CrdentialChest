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
            
            NavigationStack(path: $router.path) {
                GeometryReader { geo in
                    if vm.iCloudAllowed {
                        credentials
                    } else {
                        VStack(alignment: .center) {
                            Spacer()
                            Text("Check iCloud Status".localized)
                                .font(.title3)
                                .foregroundStyle(Color.secondaryLabel)
                                .multilineTextAlignment(.center)
                                .padding()
                            refreshiCloudButton
                            Spacer()
                        }
                        .padding()
                        .frame(width: geo.size.width)
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

private extension HomeView {
    var refreshiCloudButton: some View {
        Button(action: {
            vm.getiCloudStatus()
        }, label: {
            Symbols.arrowClockwise
                .resizable()
                .scaledToFit()
                .frame(width: 20)
        })
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
}
