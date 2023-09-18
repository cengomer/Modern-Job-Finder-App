//
//  ApplyView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct ApplyView: View {
    var offer: OfferViewModel
    @EnvironmentObject var book: FavView
    @State private var selectedOption = 0
    let options = ["omerelmas@gmail.com"]
    let options2 = ["Turkey(+90)"]
    let options3 = ["+90 123 321 12 31"]
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading){
                Text("Apply to \(offer.companyName)")
                    .font(.title2)
                
                Divider()
                
                Text("Contact info")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack{
                    Image("ai")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                    
                    VStack(alignment:.leading , spacing:4){
                        Text("Omer Elmas")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        VStack(alignment:.leading ,spacing:0){
                            Text("iOS Apps Developer")
                            
                            Text("Istanbul, Turkey")
                                .font(.callout)
                                .foregroundColor(Color(.systemGray3))
                        }
                    }
                    
                }
                
                VStack (alignment:.leading){
                    Text("Email address*")
                        Picker("Select an option", selection: $selectedOption) {
                            ForEach(0..<options.count) { index in
                                Text(self.options[index]).tag(index)
                            }
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(.black , lineWidth:1)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.black)
                        }
                .padding(.bottom)
                VStack (alignment:.leading){
                    Text("Phone country code*")
                        Picker("Select an option", selection: $selectedOption) {
                            ForEach(0..<options2.count) { index in
                                Text(self.options2[index]).tag(index)
                            }
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(.black , lineWidth:1)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.black)
                        }
                
                .padding(.bottom)
                VStack (alignment:.leading){
                    Text("Mobile phone number*")
                        Picker("Select an option", selection: $selectedOption) {
                            ForEach(0..<options3.count) { index in
                                Text(self.options3[index]).tag(index)
                            }
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(.black , lineWidth:1)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.black)
                        }
                .padding(.bottom)
                Divider()
                
                HStack {
                    
                    Text("Back")
                        .foregroundColor(Color(.systemBlue))
                        .font(.headline)
                        .padding(.horizontal)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Button {
                        dismiss()
                    } label: {
                    
                       Text("Submit application")
                           .font(.headline)
                           .fontWeight(.semibold)
                           .foregroundColor(.white)
                           .padding(8)
                           .background(Color(.systemBlue))
                           .clipShape(Capsule())
                   
                    }
                }
                .frame(maxWidth: .infinity , alignment : .trailing)
                .padding(.top)

               
                
                Spacer()
                
            }.padding()
        }
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView(offer: OfferViewModel(
            id: "1",
            offerImage: "Spotify",
            offerTitle: "Sample Offer",
            companyName: "Sample Company",
            companyRegion: "Sample Region",
            offerHashtags: ["Tag1", "Tag2"],
            applicantsImage: "ai",
            applicantsNumber: 10,
            publishedDate: "2023-07-25"
        ))
    }
}
