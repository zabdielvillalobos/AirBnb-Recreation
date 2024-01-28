//
//  LoginView.swift
//  AirBnbClone
//
//  Created by Zabdiel Villalobos on 12/1/23.
//

import SwiftUI

struct LoginView: View {
    private let service: AuthService
    @StateObject private var viewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss
    
    init(service: AuthService) {
        self.service = service 
        self._viewModel = StateObject(wrappedValue: LoginViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image("airbnb-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(StandardTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task {
                        await viewModel.login()
                        dismiss() 
                    }
                } label: {
                    Text(viewModel.isAuthenticating ? "" : "Login")
                        .foregroundColor(.white)
                        .modifier(StandardButtonModifier())
                        .overlay {
                            if viewModel.isAuthenticating {
                                ProgressView()
                                    .tint(.white)
                            }
                        }
                }
                .disabled(viewModel.isAuthenticating || !formIsValid)
                .opacity(formIsValid ? 1 : 0.7)
                
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    Text("Sign up here..")
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)

            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please try again.."))
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !viewModel.email.isEmpty
        && viewModel.email.contains("@")
        && !viewModel.password.isEmpty
    }
}

#Preview {
    LoginView(service: AuthService())
}
