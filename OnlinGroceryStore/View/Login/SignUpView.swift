//
//  SignUpView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 14/01/2025.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {

        ZStack(alignment: .top) {
            backgroundImage()
            
            VStack(spacing: 0) {
                // CustomAppBar placed at the top
                CustomAppBar(
                    leftIcon: "back",
                    leftAction: { dismiss() }
                )
//                .frame(height: 45) // Set a fixed height for the app bar
//                .ignoresSafeArea(edges: .top) // Ignore the safe area to stick it to the top
                
                ScrollView {
                    VStack {
                        logoImage()
                        titleSection(title: "Sign Up", subtitle: "Enter your credentials to continue")
                        
                        FormTextfield(
                            title: "Username",
                            placholder: "Enter your Username",
                            txt: $mainVM.txtUsername
                        )
                        .padding(.bottom, .screenWidth * 0.07)
                        
                        FormTextfield(
                            title: "Email",
                            placholder: "Enter your email address",
                            txt: $mainVM.txtEmail,
                            keyboardType: .emailAddress
                        )
                        .padding(.bottom, .screenWidth * 0.07)
                        
                        FormSecureField(
                            title: "Password",
                            placholder: "Enter your password",
                            txt: $mainVM.txtPassword,
                            isShowPassword: $mainVM.isShowPassword
                        )
                        .padding(.bottom, .screenWidth * 0.02)
                        
                        termsAndConditionsSection()
                        
                        RoundButton(title: "Sign Up") {
                            mainVM.serviceCallSignUp()
                        }
                        .padding(.bottom, .screenWidth * 0.05)
                        
                        // Signup Navigation
                        NavigationLink {
                            SignInView()
                        } label: {
                            HStack {
                                Text("Alredy have an account?")
                                    .font(.customfont(.semibold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                
                                Text("Sign In")
                                    .font(.customfont(.semibold, fontSize: 14))
                                    .foregroundColor(.primaryApp)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, .topInsets )
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets)
                }
            }
        }
        .alert(isPresented: $mainVM.showError) {
            Alert(
                title: Text(Globs.appName),
                message: Text(mainVM.errorMessage),
                dismissButton: .default(Text("Ok"))
            )
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
}

// MARK: - Preview
#Preview {
    SignUpView()
}
