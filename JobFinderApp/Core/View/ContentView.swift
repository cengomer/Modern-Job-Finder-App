//
//  ContentView.swift
//  JobFinderApp
//
//  Created by omer elmas on 24.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthenticationViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                StartPageView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())

    }
}
