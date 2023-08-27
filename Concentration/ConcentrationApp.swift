//
//  ConcentrationApp.swift
//  Concentration
//
//  Created by Blaine Beltran on 8/18/23.
//

import SwiftUI

@main
struct ConcentrationApp: App {
    @State var isAuthenticated = false
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                ContentView()
            } else {
                AuthenticationView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}
