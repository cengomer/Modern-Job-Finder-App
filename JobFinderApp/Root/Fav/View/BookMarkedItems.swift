//
//  BookMarkedItems.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct BookMarkedItems: View {
    @EnvironmentObject var offer: FavView
    
    var body: some View {
        NavigationStack {
            List {
                    ForEach(offer.favoriteItems) { item in
                        Section {
                            
                            HStack(spacing:12){
                                Image(item.offerImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                
                                VStack(alignment:.leading){
                                    Text(item.offerTitle)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)

                                    Text("\(item.companyName) · \(item.companyRegion)")
                                        .lineLimit(1)
                                    
                                }
                                Spacer()
                                
                                
                            }
                        }
                    }
                
            }
            .navigationTitle("Favorite Items")
        }
    }
}

struct BookMarkedItems_Previews: PreviewProvider {
    static var previews: some View {
        BookMarkedItems()
            .environmentObject(FavView())

    }
}
