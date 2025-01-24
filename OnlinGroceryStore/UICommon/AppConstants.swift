//
//  Globs.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 16/01/2025.
//


import SwiftUI

///Globs
struct AppConstants {
    // MARK: - App Information
    static let appName = "Online Groceries"
    
    // MARK: - API Configuration
    struct API {
        static let baseURL = "http://localhost:3001/api/app/"
        
        // MARK: - Endpoints
        struct Endpoints {
            static let login = baseURL + "login"
            static let signUp = baseURL + "sign_up"
            static let home = baseURL + "home"
        }
        
        // MARK: - User Defaults Keys
        struct UserDefaultsKeys {
            /// Key for storing user payload in UserDefaults.
            static let userPayload = "user_payload"
            /// Key for storing user login status in UserDefaults.
            static let userLogin = "user_login"
        }
    }
}


// MARK: - API Response Keys
struct ResponseKeys {
    /// Key for the status in API responses (e.g., "success" or "error").
    static let status = "status"
    /// Key for the message in API responses (e.g., "Login successful").
    static let message = "message"
    /// Key for the payload data in API responses (e.g., user data).
    static let payload = "payload"
}


