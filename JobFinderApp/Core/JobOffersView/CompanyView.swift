//
//  CompanyView.swift
//  JobFinderApp
//
//  Created by omer elmas on 24.07.2023.
//

import SwiftUI

struct CompanyView: View {
    let image : String
    let title : String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 55 , height: 55)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
        }.frame(width: 100, height: 112)
            .padding(6)
            .background(.white)
            .cornerRadius(22)
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView(image: "airbnb", title: "Airbnb")
    }
}
