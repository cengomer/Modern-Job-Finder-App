//
//  StartPageView.swift
//  JobFinderApp
//
//  Created by omer elmas on 24.07.2023.
//

import SwiftUI

struct StartPageView: View {
    @State private var showTabBarView = false
    @State private var showLoginView  = false
    var body: some View {
        NavigationStack {
            
            VStack {
                Button {
                    showLoginView = true
                    
                } label: {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                }.frame(maxWidth: .infinity , alignment: .trailing)
                Spacer()
                // MARK: here the logo comes
                Image("JobSearchLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .offset(y:80)
                
                // MARK: here the titels come
                
                TabView {
                    VStack {
                        Text("Find and land\nyour next job")
                            .font(.system(size:50))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text("Daily job postings at your fingertips - never miss out on your next career move")
                            .font(.callout)
                            .padding(8)
                            .multilineTextAlignment(.center)
                    }
                    .tag(0)
                    .offset(y:30)
                    
                    
                    VStack {
                        Text("Explore Career Opportunities")
                            .font(.system(size:50))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text("Discover a wide range of career opportunities from top companies and industries")
                            .font(.callout)
                            .padding(8)
                            .multilineTextAlignment(.center)
                    }
                    .tag(1)
                    .offset(y:30)
                    
                    
                    VStack {
                        Text("Build Your Network")
                            .font(.system(size:50))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text("Connect with professionals, mentors, and like-minded individuals to grow your network.")
                        
                            .font(.callout)
                            .padding(8)
                            .padding(.bottom , 0)
                            .multilineTextAlignment(.center)
                    }
                    .tag(2)
                    .offset(y:30)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)
                )
                
                
                Button(action: {
                    showTabBarView = true
                }) {
                    Text("Get started")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 60)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                
            }
        }
        .fullScreenCover(isPresented: $showTabBarView) {
            SignInView() // Present the TabBarView when the state variable is true
        }
        .fullScreenCover(isPresented: $showLoginView) {
            SignInView() // Present the TabBarView when the state variable is true
        }
    }
    
}


struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
