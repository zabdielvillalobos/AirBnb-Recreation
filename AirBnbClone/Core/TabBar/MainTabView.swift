//
//  MainTabView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct MainTabView: View {
    private let service: AuthService
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    init(service: AuthService) {
        self.service = service
    }
        
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistsView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            ProfileView(service: service, user: contentViewModel.currentUser)
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(service: AuthService())
    }
}
