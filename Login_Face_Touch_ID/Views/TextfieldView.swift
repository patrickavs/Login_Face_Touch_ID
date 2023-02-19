//
//  TextfieldView.swift
//  Login_Face_Touch_ID
//
//  Created by Patrick Alves on 15.02.23.
//

import SwiftUI

struct TextfieldView: View {
    var image: String
    @Binding var text: String
    var secure = false
    var textfieldText: String
    var body: some View {
        HStack {
            Image(systemName: image)
            
            if secure {
                SecureField(textfieldText, text: $text)
                    .foregroundColor(.secondary)
            } else {
                TextField(textfieldText, text: $text)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

/*struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}*/
