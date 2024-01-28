//
//  ExploreService.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import Foundation

class ExploreService {    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
