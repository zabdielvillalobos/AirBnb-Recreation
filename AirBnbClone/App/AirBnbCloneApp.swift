//
//  AirBnbCloneApp.swift
//  AirBnbClone
//
//  Created by Stephan Dowless on 6/14/23.
//

import SwiftUI

@main
struct AirBnbCloneApp: App {
    let authService = AuthService()
    let userService = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userService)
        }
    }
}
