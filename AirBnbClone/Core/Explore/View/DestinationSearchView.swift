//
//  DestinationSearchView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case members
}

struct DestinationSearchView: View {
    @EnvironmentObject var viewModel: ExploreViewModel
    @State private var selectedOption = DestinationSearchOptions.location
    @State private var numberOfGuests = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .foregroundColor(.black)
                        .padding(6)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 1.0)
                                .foregroundColor(.gray)
                        )
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        Task { await viewModel.fetchListings() }
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                            
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    )
                } else {
                    HStack {
                        Text("Where")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text("Add destination")
                    }
                    .fontWeight(.semibold)
                    .font(.subheadline)
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .cornerRadius(12)
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) { selectedOption = .location }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    HStack {
                        Text("When")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text("Add dates")
                    }
                    .fontWeight(.semibold)
                    .font(.subheadline)
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 180 : 64)
            .background(.white)
            .cornerRadius(12)
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) { selectedOption = .dates }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .members {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                }
                
                HStack {
                    if selectedOption != .members {
                        Text("Who")
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    if selectedOption == .members {
                        Stepper {
                            Text("\(numberOfGuests) Adults")
                        } onIncrement: {
                            numberOfGuests += 1
                        } onDecrement: {
                            guard numberOfGuests >= 0 else { return }
                            numberOfGuests -= 1
                        }
                    } else {
                        Text("Add guests")
                    }
                        
                }
                .fontWeight(.semibold)
                .font(.subheadline)
            }
            .padding()
            .frame(height: selectedOption == .members ? 120 : 64)
            .background(.white)
            .cornerRadius(16)
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeInOut) { selectedOption = .members }
            }
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    @Namespace var namespace
    static var previews: some View {
        DestinationSearchView(show: .constant(true))
    }
}
