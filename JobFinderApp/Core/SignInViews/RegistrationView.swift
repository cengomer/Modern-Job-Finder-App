//
//  RegistrationView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullname = ""
    @EnvironmentObject var viewModel : AuthenticationViewModel

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("JobSearchLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 170)
                    .padding(.bottom , 40)
                
                VStack(alignment: .leading){
                    TextFieldsInputView(text: $fullname, title: "Fullname", placeholder: "Enter Your fullname")
                        .padding(.vertical ,5)
                    
                    TextFieldsInputView(text: $email, title: "Email", placeholder: "Enter Your Email")
                        .padding(.vertical , 5)
                        .textInputAutocapitalization(.never)

                    TextFieldsInputView(text: $password, title: "Password", placeholder: "Enter Your Password" , isSecureField: true)
                        .padding(.vertical , 5)

                    
                    TextFieldsInputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm Your Password" , isSecureField: true)
                        .padding(.vertical , 5)

                    
                }.padding()
                
                if let errorMessage = viewModel.errorMessage {
                                Text(errorMessage)
                                    .foregroundColor(.red)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .frame(width: 350, height: 80)
                }
                
                Button {
                    Task {
                        try await viewModel.createUser(withEmail:email ,password:password,fullname:fullname)
                    }
                } label: {
                    Text("SIGN UP →")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                        .background(Color(.systemBlue))
                        .cornerRadius(12)
                        .padding(.top)
                }
            Spacer()
            Divider()
                
                HStack (spacing:1){
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Already have an account? ").foregroundColor(.blue) +
                        Text("Sign In").fontWeight(.semibold)
                            .foregroundColor(.blue)

                    }

                 
                        
                }.foregroundColor(.blue)
            }
        }
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
