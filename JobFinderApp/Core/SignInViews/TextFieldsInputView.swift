//
//  TextFieldsInputView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct TextFieldsInputView: View {
    @Binding var text : String
    
    let title: String
    let placeholder: String
    var isSecureField = false
    
    
    var body: some View {
        VStack (alignment: .leading , spacing: 4){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder , text: $text)
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width - 42, height: 48)
                    .cornerRadius(12)
            } else {
                TextField(placeholder , text: $text)
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.width - 42, height: 48)
                    .cornerRadius(12)
                    
            }
            Divider()

            
        }
    }
}

struct TextFieldsInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsInputView(text: .constant(""), title: "Password", placeholder: "Enter Your Password")
    }
}
