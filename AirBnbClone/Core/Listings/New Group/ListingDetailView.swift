//
//  ListingDetailView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        self._cameraPosition = State(initialValue: .region(MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        ))
    }
        
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                TabView {
                    ForEach(listing.imageURLs, id: \.self) { imageUrl in
                        Image(imageUrl)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Rectangle())
                    }
                }
                .frame(height: 320)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    )
                    .onTapGesture {
                        dismiss()
                    }
                .padding(.top, 40)
                .padding(.leading, 32)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Text("5.00 -")
                        
                        Text("100+ reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    
                    Text("\(listing.city), \(listing.state)")
                        .font(.caption)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.description.lowercased()) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                CircularProfileImageView(imageUrl: listing.ownerImageUrl,
                                         size: .large)
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(systemName: "bed.double")
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Bedroom \(bedroom)")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .frame(width: 132, height: 100, alignment: .leading)
                                .padding(.leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                )
                                
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ForEach(listing.amenities) { feature in
                        HStack {
                            Image(systemName: feature.imageName)
                                .frame(width: 32)
                            
                            Text(feature.title)
                                .font(.footnote)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .cornerRadius(12)
            }
            .padding()
        }
        .padding(.bottom, 72)
        .overlay(alignment: .bottom, content: {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("$1000")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Aug 13 - 18")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        print("DEBUG: Reserve listing here..")
                    } label: {
                        Text("Reserve")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 36)
            }
            .background(.white)
        })
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea(edges: .top)
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(listing: DeveloperPreview.shared.listings[0])
    }
}
