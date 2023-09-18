//
//  SettingView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var viewModel : AuthenticationViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("ai")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Text("Settings")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment:.leading , spacing:8){
                    SettingsRowView(image: "person.fill", title: "Account preferences").padding(.vertical)
                    SettingsRowView(image: "lock", title: "Sign in & security").padding(.vertical)
                    SettingsRowView(image: "eye", title: "Visibility").padding(.vertical)
                    SettingsRowView(image: "shield", title: "Data privacy").padding(.vertical)
                    SettingsRowView(image: "newspaper", title: "Advertising data").padding(.vertical)
                    SettingsRowView(image: "bell", title: "Notifications").padding(.vertical)
                    
                    Divider()
                }
                .padding()
                .padding(.top , 10)
                
                VStack(alignment: .leading) {
                    ForEach(["Help Center" , "Privacy Policy" , "Accessibility" , "Recommendation Transparency" , "User Agreement" , "End User License Agreement"  , "VERSION: 4.1.735.1"] , id:\.self) { setting in
                        Text(setting)
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                    } .padding()
                        .padding(.top , 10)
                    
                    Text("Sign Out")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .onTapGesture {
                            viewModel.signOut()
                        }
                        .padding()
                            .padding(.top , 10)
                }
            }
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
