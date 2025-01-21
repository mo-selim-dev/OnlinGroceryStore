//
//  LoginView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 14/01/2025.
//



import SwiftUI

struct LoginView: View {

    // MARK: - Environment
    @Environment(\.dismiss) var dismiss

    // MARK: - Observed Object
    @ObservedObject private var loginVM = MainViewModel.shared

    // MARK: - Body
    var body: some View {
        ZStack {
            // Background Image
            backgroundImage

            // Back Button
            backButton

            // Main Content
            VStack(spacing: 20) {
                // Logo
                logoImage

                // Title and Subtitle
                titleSection

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
                signupSection

                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
        }
        .alert(isPresented: $loginVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(loginVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

// MARK: - Subviews
extension LoginView {

    // Background Image
    private var backgroundImage: some View {
        Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
    }

    // Back Button
    private var backButton: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }

                Spacer()
            }

            Spacer()
        }
        .padding(.top, .topInsets)
        .padding(.horizontal, 20)
    }

    // Logo Image
    private var logoImage: some View {
        Image("color_logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            .padding(.bottom, .screenWidth * 0.1)
    }

    // Title and Subtitle Section
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Login") // Fixed typo: "Loging" -> "Login"
                .font(.customfont(.semibold, fontSize: 26))
                .foregroundStyle(Color.primaryText)

            Text("Enter your email and password")
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.secondaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, .screenWidth * 0.1)
    }

    // Signup Section
    private var signupSection: some View {
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
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
