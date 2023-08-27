//
//  AuthenticationView.swift
//  Concentration
//
//  Created by Blaine Beltran on 8/26/23.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @Binding var isAuthenticated: Bool
    @StateObject var authService = AuthenticationService()
    @State var username: String = ""
    @State var password: String = ""
    
    typealias Copy = Constants.Auth
    
    var body: some View {
        VStack(spacing: 30) {
            TextField(Copy.usernamePlaceholder, text: $username)
            TextField(Copy.passwordPlaceholder, text: $password)
            
            Button(Copy.loginButtonTitle) {
                if username == password {
                    print("yes")
                } else {
                    print("no")
                }
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
 
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .onAppear {
            Task {
                try await isAuthenticated = authService.authenticate()
            }
        }
    }
}


struct AuthenticationView_Preview: PreviewProvider {
    static var previews: some View {
        AuthenticationView(isAuthenticated: .constant(true))
    }
}
