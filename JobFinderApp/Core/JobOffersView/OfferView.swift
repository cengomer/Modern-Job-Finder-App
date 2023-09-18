import SwiftUI

struct OfferView: View {
    var offer: OfferViewModel // A single OfferViewModel instance
    @State private  var bookmark = false
    
    @EnvironmentObject var book: FavView

    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // Load company image from offer data
                Image(offer.offerImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                
                VStack(alignment: .leading) {
                    Text(offer.offerTitle)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("\(offer.companyName) · \(offer.companyRegion)")
                }
                
                Spacer()
                
                Image(systemName: "bookmark\(bookmark ? ".fill" : "")")
                    .imageScale(.large)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        bookmark.toggle()
                        if bookmark {
                            book.addToFavorites(item: offer)
                        } else {
                            book.removeFromFavorites(item: offer)
                        }
                    }
            }
            
            HStack(spacing: 12) {
                // Display hashtags from offer data
                ForEach(offer.offerHashtags, id: \.self) { hashtag in
                    Text(hashtag)
                        .font(.callout)
                        .fontWeight(.medium)
                        .padding(4)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .padding(.top, 18)
            
            HStack(spacing: -10) {
                // Load applicants image from offer data
                ForEach(0..<3, id: \.self) { _ in
                    Image(offer.applicantsImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .background(.black)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        }
                }
                
                Text("\(offer.applicantsNumber) Applicants")
                    .offset(x: 20)
                
                Spacer()
                
                Text(offer.publishedDate)
            }
            .padding(.top, 20)
            
            NavigationLink(destination:  {
                ApplyView(offer: offer)
                    .navigationBarBackButtonHidden()
            }) {
                Text("APPLY NOW")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 68, height: 68)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 15)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .frame(width: 370, height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .overlay {
            bookmark ?
            RoundedRectangle(cornerRadius: 20).stroke(Color.yellow , lineWidth: 3) : nil
        }
    
        .onAppear {
            bookmark = book.favoriteItems.contains(offer)
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        // You can provide a sample OfferViewModel instance for preview if needed
        OfferView(offer: OfferViewModel(
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
