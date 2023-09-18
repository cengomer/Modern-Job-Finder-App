//
//  SignInView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("JobSearchLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 170)
                    .padding(.bottom , 40)
                
                VStack(alignment: .leading){
                    TextFieldsInputView(text: $email, title: "Email", placeholder: "Enter Your Email")
                        .padding(.vertical)
                        .textInputAutocapitalization(.never)
                    
                    TextFieldsInputView(text: $password, title: "Password", placeholder: "Enter Your Password" , isSecureField: true)
                    
                }.padding()
                
                Text("Forgot password?")
                    .foregroundColor(Color(.systemBlue))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                Button {
                    Task {
                        
                        try await viewModel.signIn(withEmail:email,
                                                   password:password)
                    }
                } label: {
                    Text("SIGN IN →")
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
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Don`t have an account? ").foregroundColor(.blue) +
                        Text("Sign up").fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                    }
                    
                    
                    
                }.foregroundColor(.blue)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
