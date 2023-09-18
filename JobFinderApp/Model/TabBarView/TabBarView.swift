//
//  TabBarView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//
import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    // Tab 0
                    JobOffersView()
                        .tabItem {
                            Image(systemName: "house")
                                .background(.blue)

                        }
                        .tag(0)
                    
                    // Tab 1
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(1)
                    
                    // Tab 2
                    BookMarkedItems()
                        .tabItem {
                            Image(systemName: "bookmark")
                        }
                        .tag(2)
                    
                    // Tab 3
                   AllMessages()
                        .tabItem {
                            Image(systemName: "envelope")
                        }
                        .tag(3)
                    
                    // Tab 4
                    SettingView()
                        .tabItem {
                            Image(systemName: "gear")
                        }
                        .tag(4)
                }
                .accentColor(Color(.systemBlue))
                // Change the active color to white
                
                // Circular background with system blue color for the active tab
        
            }
        }
    }
}




struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
