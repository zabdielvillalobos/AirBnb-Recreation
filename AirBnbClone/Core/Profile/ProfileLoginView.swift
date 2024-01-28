//
//  ProfileLoginView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct ProfileLoginView: View {
    @State private var showLoginSheet = false
    private let service: AuthService

    init(service: AuthService) {
        self.service = service
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Log in to start planning your next trip.")
                    .font(.subheadline)
            }
            
            Button {
                showLoginSheet.toggle()
            } label: {
                Text("Log in")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                    .background(.pink)
                    .cornerRadius(8)
            }
            
            HStack {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
        }
        .sheet(isPresented: $showLoginSheet) {
            LoginView(service: service)
        }
    }
}

#Preview {
    ProfileLoginView(service: AuthService())
}
