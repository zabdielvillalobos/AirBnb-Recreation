//
//  UserService.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.

import Foundation

class UserService {
    func fetchCurrentUser() async throws -> User {
        return User(
            accountType: .guest,
            fullname: "John Doe",
            email: "johndoe@gmail.com",
            profileImageUrl: "male-profile-photo"
        )
    }
}
