//
//  BiometricImageView.swift
//  Login_Face_Touch_ID
//
//  Created by Patrick Alves on 19.02.23.
//

import SwiftUI
import LocalAuthentication

struct BiometricImageView: View {
    var body: some View {
        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color(uiColor: .blue))
            .clipShape(Circle())
    }
}

struct BiometricImageView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricImageView()
    }
}
