//
//  SearchView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var offers: [OfferViewModel] = [] // Use @State to store the fetched offers
    @State private var searchQuery = "" // Search query variable
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.systemGray5)

                ScrollView(showsIndicators: false){
                    SearchBar(searchQuery: $searchQuery)
                        .padding(.top , 70)
                    
                    
                    VStack {
                        let filteredOffers = offers.filter { $0.offerTitle.localizedCaseInsensitiveContains(searchQuery) || searchQuery.isEmpty }
                        
                        // Check if there are any filtered offers
                        if filteredOffers.isEmpty {
                            Text("No results found for '\(searchQuery)'")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 20)
                                .lineLimit(1)
                        } else {
                            // Display filtered offers using ForEach
                            ForEach(filteredOffers) { offer in
                                OfferView(offer: offer)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    .offset(y:50)
                }

            }.ignoresSafeArea()
            .onAppear(perform: fetchOffers)
        }
    }
    private func fetchOffers() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                offers = try JSONDecoder().decode([OfferViewModel].self, from: data)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
