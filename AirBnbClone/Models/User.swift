//
//  User.swift
//  AirBnbClone
//
//  Created by Stephan Dowless on 6/20/23.
//

import Foundation

struct User: Identifiable, Codable {
    var id = NSUUID().uuidString
    var accountType: AccountType
    let fullname: String
    let email: String
    let profileImageUrl: String
}

enum AccountType: Int, Codable {
    case host
    case guest
    
    var description: String {
        switch self {
        case .host: return "Host"
        case .guest: return "Guest"
        }
    }
}
