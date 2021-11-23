//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 9/20/21.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
