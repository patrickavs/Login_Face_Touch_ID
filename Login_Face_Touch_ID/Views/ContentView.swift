//
//  ContentView.swift
//  Login_Face_Touch_ID
//
//  Created by Patrick Alves on 15.02.23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @ObservedObject var vm: LoginViewModel
    //@AppStorage("status") var logged = false
    var body: some View {
        NavigationStack {
            if vm.logged {
                Text("Logged In..")
                    .font(.title)
                    .foregroundColor(.green)
                    .navigationTitle("Home")
            } else {
                DetailView(vm: vm)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: LoginViewModel())
    }
}

struct DetailView: View {
    //@State private var username = ""
    //@State private var password = ""
    @ObservedObject var vm: LoginViewModel
    //@AppStorage("stored_User") var user = "pattikev7@gmail.com"
    //@AppStorage("status") var logged = false
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.cyan)
                    .rotationEffect(Angle(degrees: 45))
                
                Rectangle()
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: 135))
                    .opacity(0.5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        Text("Please sign in to continue")
                            .foregroundColor(.white)
                            .font(.callout)
                    }
                }
                .padding(.horizontal, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(.black)
            .padding(-30)
            .cornerRadius(-10)
            .ignoresSafeArea()
            
            VStack() {
                TextfieldView(image: "envelope", text: $vm.username, secure: false, textfieldText: "Email")
                    .padding(.vertical)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .textInputAutocapitalization(.never)
                
                TextfieldView(image: "lock", text: $vm.password, secure: true, textfieldText: "Password")
                    .padding(.vertical)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.never)
                
                HStack {
                    Button {
                        print("login")
                    } label: {
                        Text("Login")
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .background(Color(uiColor: .blue))
                            .clipShape(Capsule())
                    }
                    .disabled(vm.username == "" && vm.password == "")
                    
                    if vm.getBioMetricStatus() {
                        Button {
                            vm.authenticateUser()
                        } label: {
                            // Biometric-Image
                            BiometricImageView()
                        }

                    }
                }
                .padding(.top, 100)
                
                Button {
                    print("forget_password")
                } label: {
                    Text("Forget password?")
                }

                Spacer()
                
                HStack(spacing: 10) {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Button {
                        print("signup")
                    } label: {
                        Text("Signup")
                            .bold()
                            .foregroundColor(.black)
                    }
                }
        
            }
        }
        .background(.white)
        .animation(.easeOut, value: vm.logged)
    }
    
    /// Getting BioMetricType
    /*func getBioMetricStatus() -> Bool {
        let scanner = LAContext()
        if username == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        
        return false
    }*/
    
    /// User-Authentication
    /*func authenticateUser() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock \(username)") { status, error in
            if error != nil {
                print(error?.localizedDescription ?? "error occured")
                return
            }
            
            withAnimation(.easeOut) {
                logged = true
            }
        }
    }*/
}
