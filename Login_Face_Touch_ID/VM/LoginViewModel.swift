//
//  LoginViewModel.swift
//  Login_Face_Touch_ID
//
//  Created by Patrick Alves on 15.02.23.
//

import Foundation
import LocalAuthentication

final class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var user = "pattikev7@gmail.com"
    @Published var password = ""
    @Published var logged = false
    
    /// User-Authentication
    func authenticateUser() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock \(username)") { status, error in
            if error != nil {
                print(error?.localizedDescription ?? "error occured")
                return
            }
            DispatchQueue.main.async {
                self.logged = true
            }
        }
    }
    
    /// Getting BioMetricType
    func getBioMetricStatus() -> Bool {
        let scanner = LAContext()
        if username == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        
        return false
    }
}
