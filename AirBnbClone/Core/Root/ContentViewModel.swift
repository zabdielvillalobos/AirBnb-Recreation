//
//  ContentViewModel.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import Foundation
import Combine
import CoreLocation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var currentLocation: CLLocationCoordinate2D?
    
    private var cancellables = Set<AnyCancellable>()
    private let authService: AuthService
    private let userService: UserService
    
    private var locationManager = LocationManager()
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        authService.$didAuthenticateUser.sink { [weak self] authenticated in
            self?.isAuthenticated = authenticated
            guard authenticated else { return }
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
        
        locationManager.$location.sink { [weak self] coordinates in
            self?.currentLocation = coordinates
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        Task { self.currentUser = try await userService.fetchCurrentUser() }
    }
}
