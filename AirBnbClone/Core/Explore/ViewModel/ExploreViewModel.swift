//
//  ExploreViewModel.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI
import CoreLocation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var coordinateRegion: CLLocationCoordinate2D = .losAngeles
    @Published var searchLocation: String = ""
    
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    @MainActor
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Error fetching listings \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        configureCoordinateRegion()
        
        let fileteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = fileteredListings.isEmpty ? listings : fileteredListings
    }
            
    func configureCoordinateRegion() {
        switch searchLocation {
        case "Los Angeles", "LA":
            self.coordinateRegion = .losAngeles
        case "Miami":
            self.coordinateRegion = .miami
        default:
            break
        }
    }
}
