//
//  AuthenticationService.swift
//  Concentration
//
//  Created by Blaine Beltran on 8/26/23.
//

import LocalAuthentication
import Foundation


enum AuthenticationError: Error {
    case unableToAuthenticate
    case biometricsNotAllowed
    case biometricsNotAvailable
}

class AuthenticationService: ObservableObject {
    private(set) var isUnlocked = false
    private let context = LAContext()
    private var error: NSError?
    
    func authenticate() async throws -> Bool {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "We need to unlock your phone"
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if success {
                    await MainActor.run {
                        isUnlocked = true
                    }
                }
            } catch {
                throw AuthenticationError.unableToAuthenticate
            }
            
        } else {
            throw AuthenticationError.biometricsNotAvailable
        }
        return isUnlocked
    }
}
