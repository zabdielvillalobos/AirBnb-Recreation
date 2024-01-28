//
//  ListingView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct ListingView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
                ZStack(alignment: .topTrailing) {
                    TabView {
                        ForEach(listing.imageURLs, id: \.self) { imageUrl in
                            Image(imageUrl)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .frame(height: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .tabViewStyle(.page)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                    .foregroundStyle(.white)
                    .shadow(color: .black, radius: 10)
                    .padding()
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(listing.city), \(listing.state)")
                            .fontWeight(.semibold)
                        
                        VStack(spacing: 0) {
                            Text("100+ mi away")
                                .foregroundStyle(.gray)
                            
                            Text("Aug 13 - 18")
                                .foregroundStyle(.gray)
                        }
                        
                        HStack(spacing: 4) {
                            Text("$1000")
                                .fontWeight(.semibold)
                            
                            Text("night")
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Text("5.0")
                            .font(.footnote)
                    }
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding()
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(listing: DeveloperPreview.shared.listings[2])    }
}
