//
//  FavView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import Foundation


class FavView: ObservableObject {
    @Published var favoriteItems = [OfferViewModel]()
    
    
    func addToFavorites(item: OfferViewModel) {
        favoriteItems.append(item)
    }
    
    func removeFromFavorites(item: OfferViewModel) {
        if let index = favoriteItems.firstIndex(of: item) {
            favoriteItems.remove(at: index)
        }
    }
}
