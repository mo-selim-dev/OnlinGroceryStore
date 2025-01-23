//
//  Globs.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 16/01/2025.
//


import SwiftUI

struct AppConstants {
    static let AppName = "Online Groceries"
    
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    
    static let SV_LOGIN = BASE_URL + "login"
    static let SV_SIGN_UP = BASE_URL + "sign_up"
    static let SV_HOME = BASE_URL + "home"

    
}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}
