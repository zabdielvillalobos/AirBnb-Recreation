//
//  AuthError.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import Foundation

enum AuthError: Error {
    case invalidEmail
    case invalidPassword
    case userNotFound
    case weakPassword
    case unknown
}
