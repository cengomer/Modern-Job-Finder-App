//
//  MessageView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct MessageView: View {
    let image : String
    let name : String
    let prevMessage: String
    let activeStatus : Bool
    let lastSeen : String
    var body: some View {
        NavigationStack {
            
            VStack(alignment:.leading){
                
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading,spacing:2){
                        Text(name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(activeStatus ? "Active now" : prevMessage)
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(lastSeen)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
                
            }.padding()
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(image: "ai", name: "Omer Elmas", prevMessage: "You : Okay", activeStatus: false, lastSeen: "04:25PM")
    }
}
