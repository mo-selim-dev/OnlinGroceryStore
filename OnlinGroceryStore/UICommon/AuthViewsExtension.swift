//
//  SwiftUIView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 22/01/2025.
//

import SwiftUI

// MARK: - AuthViewsExtension
/// This file contains shared SwiftUI components for authentication screens (e.g., LoginView, SignUpView).
/// These components are reusable and can be used across multiple views to ensure consistency.

// MARK: - Shared Subviews and Logic
extension View {
    // MARK: Background Image
    /// Returns a background image for authentication screens.
    func authBackgroundImage() -> some View {
        Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
    }
    
    // MARK: Back Button
    /// Returns a back button for authentication screens.
    /// - Parameter dismiss: The `DismissAction` to handle the back button tap.
    func authBackButton(dismiss: DismissAction) -> some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.top, .topInsets)
        .padding(.horizontal, 20)
    }
    
    // MARK: Logo Image
    /// Returns a logo image for authentication screens.
    func authLogoImage() -> some View {
        Image("color_logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            .padding(.bottom, .screenWidth * 0.1)
    }
    
    // MARK: Title Section
    /// Returns a title and subtitle section for authentication screens.
    /// - Parameters:
    ///   - title: The title text.
    ///   - subtitle: The subtitle text.
    func authTitleSection(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.customfont(.semibold, fontSize: 26))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
            
            Text(subtitle)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, .screenWidth * 0.1)
        }
    }
    
    // MARK: Terms and Conditions Section
    /// Returns a terms and conditions section for authentication screens.
    /// - Parameters:
    ///   - termsText: The text for the terms of service link.
    ///   - privacyText: The text for the privacy policy link.
    ///   - termsColor: The color for the terms of service link.
    ///   - privacyColor: The color for the privacy policy link.
    func termsAndConditionsSection(
        termsText: String = "Terms of Service",
        privacyText: String = "Privacy Policy.",
        termsColor: Color = .primaryApp,
        privacyColor: Color = .primaryApp
    ) -> some View {
        VStack {
            Text("By continuing you agree to our")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(termsText)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(termsColor)
                
                Text(" and ")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(.secondaryText)
                
                Text(privacyText)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(privacyColor)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, .screenWidth * 0.02)
        }
    }
}


