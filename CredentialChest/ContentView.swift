//
//  ContentView.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello".localized)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}
