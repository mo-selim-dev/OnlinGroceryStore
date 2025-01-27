//
//  SignUpView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 14/01/2025.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var signUpVM = MainViewModel.shared
    
    var body: some View {
        ZStack {
            backgroundImage()
            backButton(action: dismiss)
            
            ScrollView {
                VStack {
                    logoImage()
                    titleSection(title: "Sign Up", subtitle: "Enter your credentials to continue")
                    
                    FormTextfield(
                        title: "Username",
                        placholder: "Enter your Username",
                        txt: $signUpVM.txtUsername
                    )
                    .padding(.bottom, .screenWidth * 0.07)
                    
                    FormTextfield(
                        title: "Email",
                        placholder: "Enter your email address",
                        txt: $signUpVM.txtEmail,
                        keyboardType: .emailAddress
                    )
                    .padding(.bottom, .screenWidth * 0.07)
                    
                    FormSecureField(
                        title: "Password",
                        placholder: "Enter your password",
                        txt: $signUpVM.txtPassword,
                        isShowPassword: $signUpVM.isShowPassword
                    )
                    .padding(.bottom, .screenWidth * 0.02)
                    
                    termsAndConditionsSection()
                    
                    RoundButton(title: "Sign Up") {
                        signUpVM.serviceCallSignUp()
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
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
        }
        .alert(isPresented: $signUpVM.showError) {
            Alert(
                title: Text(Globs.appName),
                message: Text(signUpVM.errorMessage),
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
