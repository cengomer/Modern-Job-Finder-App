//
//  OfferViewModel.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import Foundation

struct OfferViewModel: Hashable , Codable , Identifiable {
    
    let id : String
    let offerImage : String
    let offerTitle : String
    let companyName : String
    let companyRegion : String
    let offerHashtags : [String]
    let applicantsImage : String
    let applicantsNumber : Int
    let publishedDate : String
    
}
