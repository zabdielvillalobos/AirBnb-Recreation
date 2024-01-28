//
//  PreviewProvider.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            ownerUid: NSUUID().uuidString,
            ownerName: "Zab Villalobos",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 6,
            numberOfBathrooms: 5,
            numberOfGuests: 10,
            pricePerNight: 420,
            numberOfBeds: 8,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURLs: ["mansion-front", "mansion-front2", "mansion3", "mansion4"],
            address: "69 Bunny Lane",
            city: "Miami",
            state: "Florida",
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa,
            title: "Playboy Mansion"
        ),
        .init(
            ownerUid: NSUUID().uuidString,
            ownerName: "Yeat",
            ownerImageUrl: "yeat-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 777,
            numberOfBeds: 4,
            latitude: 25.7706,
            longitude: -80.1340,
            imageURLs: ["listing-3", "listing-2", "listing-1", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
            type: .house,
            title: "Twizzy Rich Crib"
        ),
        .init(
            ownerUid: NSUUID().uuidString,
            ownerName: "Dak Prescott",
            ownerImageUrl: "dak-pp",
            numberOfBedrooms: 5,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 763,
            numberOfBeds: 4,
            latitude: 25.7650,
            longitude: -80.1936,
            imageURLs: ["dak1", "dak2", "dak3", "dak4", "dak5"],
            address: "",
            city: "Miami",
            state: "Florida",
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment,
            title: "ManCave Away From Girlfriend"
        ),
        .init(
            ownerUid: NSUUID().uuidString,
            ownerName: "Olivia Rodrigo",
            ownerImageUrl: "rodrigo-pp",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 763,
            numberOfBeds: 4,
            latitude: 34.2,
            longitude: -118.0426,
            imageURLs: ["tree1", "tree2", "tree3", "tree4", "tree5"],
            address: "123 Princess Palace",
            city: "Los Angeles",
            state: "California",
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .apartment,
            title: "Barbie Treehouse"
        ),
        .init(
            ownerUid: NSUUID().uuidString,
            ownerName: "Cristiano Ronaldo",
            ownerImageUrl: "cr7-pp",
            numberOfBedrooms: 7,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            pricePerNight: 763,
            numberOfBeds: 4,
            latitude: 34.1,
            longitude: -118.1426,
            imageURLs: ["listing-5", "listing-6", "listing-7", "listing-8"],
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment,
            title: "SIUUU CASA"
        ),
    ]
    
    let user = User(accountType: .guest, fullname: "Zab Villalobos", email: "zab@gmail.com", profileImageUrl: "male-profile-photo")
}
