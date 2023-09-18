//
//  AllMessages.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct AllMessages: View {
    var body: some View {
       
            VStack(alignment: .leading , spacing:16) {
                HStack {
                    Text("Chat")
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image("ai")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                }
                .padding()
                .padding(.bottom , 20)
                
                
                    MessageView(image: "ai", name: "Omer Elmas", prevMessage: "You : Okay", activeStatus: false, lastSeen: "04:25PM")
                    
                    MessageView(image: "m1", name: "John Doe", prevMessage: "Hello there!", activeStatus: true, lastSeen: "12:00 PM")
                    MessageView(image: "m2", name: "Emily Johnson", prevMessage: "Sure, see you there!", activeStatus: true, lastSeen: "09:30 AM")
                    MessageView(image: "m3", name: "Alex Smith", prevMessage: "Thanks!", activeStatus: false, lastSeen: "Yesterday")
                    MessageView(image: "m4", name: "Sophia Lee", prevMessage: "👍", activeStatus: false, lastSeen: "Yesterday")
                    MessageView(image: "m5", name: "Michael Williams", prevMessage: "I'll be late.", activeStatus: true, lastSeen: "2 days ago")
                    MessageView(image: "m6", name: "Emma Brown", prevMessage: "Can we meet tomorrow?", activeStatus: false, lastSeen: "2 days ago")
                
            }
        }
    
}

struct AllMessages_Previews: PreviewProvider {
    static var previews: some View {
        AllMessages()
    }
}
