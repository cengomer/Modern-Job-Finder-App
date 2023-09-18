import SwiftUI

struct JobOffersView: View {
    @State private var offers: [OfferViewModel] = [] // Use @State to store the fetched offers
    @State private var searchQuery = "" // Search query variable

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray5)
                ScrollView {
                    
                    SearchBar(searchQuery: $searchQuery) // Pass the search query to the SearchBar
                                    .padding()
                    
                    
                    TopCombView()
                        .padding()
                    
                    HStack(spacing: 12) {
                        CompanyView(image: "airbnb", title: "Airbnb")
                        CompanyView(image: "figma", title: "Figma")
                        CompanyView(image: "Spotify", title: "Spotify")
                    }
                    .padding()
                    
                    Text("Recommended for you")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.horizontal , 6)

                    
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
                }
                .offset(y: 50)
                .allowsHitTesting(true)
            }
            .ignoresSafeArea()
        .onAppear(perform: fetchOffers)
        } // Fetch offers when the view appears
    }
    
    // Function to fetch offers from JSON
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



struct JobOffersView_Previews: PreviewProvider {
    static var previews: some View {
        JobOffersView()
    }
}
