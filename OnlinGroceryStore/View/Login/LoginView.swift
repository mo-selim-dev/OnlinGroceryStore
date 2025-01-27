//
//  LoginView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 14/01/2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var loginVM = MainViewModel.shared
    
    var body: some View {
        ZStack {
            // Background Image
            backgroundImage()
            
            // Back Button
            backButton(action: dismiss)
            
            // Main Content
            VStack(spacing: 20) {
                // Logo
                logoImage()
                
                // Title and Subtitle
                titleSection(title: "Login", subtitle: "Enter your email and password")
                
                // Email Field
                FormTextfield(
                    title: "Email",
                    placholder: "Enter your email address",
                    txt: $loginVM.txtEmail,
                    keyboardType: .emailAddress
                )
                .padding(.bottom, 20)
                
                // Password Field
                FormSecureField(
                    title: "Password",
                    placholder: "Enter your password",
                    txt: $loginVM.txtPassword,
                    isShowPassword: $loginVM.isShowPassword
                )
                .padding(.bottom, 10)
                
                // Login Button
                RoundButton(title: "Log In") {
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom, 20)
                
                // Signup Navigation
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        Text("Don’t have an account?")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Signup")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            .alert(isPresented: $loginVM.showError) {
                Alert(
                    title: Text(Globs.appName),
                    message: Text(loginVM.errorMessage),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}


#Preview {
    LoginView()
}
