//
//  Listing.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import Foundation
import CoreLocation

struct Listing: Identifiable, Codable {
    var id = NSUUID().uuidString
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    var pricePerNight: Int
    let numberOfBeds: Int
    var latitude: Double
    var longitude: Double
    var imageURLs: [String]
    let address: String
    let city: String
    let state: String
    let features: [ListingFeatures]
    let amenities: [ListingAmenities]
    let type: ListingType
    let title: String
    
    var coordinates: CLLocationCoordinate2D {
        return .init(latitude: latitude, longitude: longitude)
    }
}

extension Listing: Hashable {
    static func == (lhs: Listing, rhs: Listing) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
