//
//  ExploreView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @State private var showListingDetail = false
    @State private var showMapView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            VStack {
                if showDestinationSearchView {
                    DestinationSearchView(show: $showDestinationSearchView)
                        .environmentObject(viewModel)
                } else {
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            LazyVStack(spacing: 36) {
                                SearchAndFilterBar(location: $viewModel.searchLocation)
                                    .onTapGesture {
                                        withAnimation(.spring()) { showDestinationSearchView.toggle() }
                                    }
                                
                                ForEach(viewModel.listings) { listing in
                                    NavigationLink(value: listing) {
                                        ListingView(listing: listing)
                                    }
                                }
                            }
                        }
                        
                        Button {
                            showMapView.toggle()
                        } label: {
                            HStack {
                                Text("Map")
                                
                                Image(systemName: "paperplane")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .padding()
                        }
                    }
                }
            }
            .sheet(isPresented: $showMapView, content: {
                ListingMapView(listings: viewModel.listings, coordinateRegion: viewModel.coordinateRegion)
            })
            .navigationDestination(for: Listing.self) { listing in
                ListingDetailView(listing: listing)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
