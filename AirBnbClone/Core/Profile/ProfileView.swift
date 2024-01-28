//
//  ProfileView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct ProfileView: View {
    
    private let service: AuthService
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    init(service: AuthService, user: User?) {
        self.service = service
    }
    
    var body: some View {
        VStack {
            if !contentViewModel.isAuthenticated {
                ProfileLoginView(service: service)
            } else if let user = contentViewModel.currentUser {
                UserProfileHeaderView(user: user)
                    .padding()
            }
            
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")
            }
            .padding(.vertical)
            
            if contentViewModel.isAuthenticated {
                Button("Log Out") {
                    service.signout()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView(service: AuthService(), user: DeveloperPreview.shared.user)
}
