//
//  User.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import Foundation


struct User: Identifiable , Codable {
    let id : String
    let fullname : String
    let email : String
}
