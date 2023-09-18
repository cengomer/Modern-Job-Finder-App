//
//  SearchBar.swift
//  JobFinderApp
//
//  Created by omer elmas on 24.07.2023.
//

import SwiftUI
struct SearchBar: View {
    @Binding var searchQuery: String // Binding to the search query variable
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .scaleEffect(1.6)
                .padding(.horizontal)
            
            TextField("Search by job title or keyword", text: $searchQuery) // Bind the TextField to the searchQuery
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal.decrease")
                .scaleEffect(1.6)
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 44, height: 44)
                .background(Color(.systemBlue))
                .padding(.horizontal, 6)
                .clipShape(Circle())
        }
        .frame(width: 350, height: 65)
        .background(.white)
        .clipShape(Capsule())
    }
}

