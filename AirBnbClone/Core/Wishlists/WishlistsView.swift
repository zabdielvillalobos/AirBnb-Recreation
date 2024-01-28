//
//  WishlistsView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Log in to view your wishlists.")
                            .font(.headline)
                        
                        Text("You can create, view or edit wishlists once you've logged in")
                            .font(.footnote)
                    }
                    .frame(width: 300)
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("Log in")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                            .background(.pink)
                            .cornerRadius(8)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Wishlists")
        }
    }
}

struct WishlistsView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistsView()
    }
}
