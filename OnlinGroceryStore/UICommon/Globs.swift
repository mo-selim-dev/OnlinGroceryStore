//
//  Globs.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 16/01/2025.
//

import SwiftUI

struct Globs {
    static let appName = "Online Groceries"
    
    struct UDKeys {
        /// Key for storing user payload in UserDefaults.
        static let userPayload = "user_payload"
        /// Key for storing user login status in UserDefaults.
        static let userLogin = "user_login"
    }
    
    struct Endpoints {
        static let baseURL = "http://localhost:3001/api/app/"
        
        static let login = baseURL + "login"
        static let signUp = baseURL + "sign_up"
        
        static let home = baseURL + "home"
        static let productDetail = baseURL + "product_detail"

    }
    
}

// MARK: - API Response Keys
struct ResponseKeys {
    static let status = "status"  /// Key for the status in API responses (e.g., "success" or "error").
    static let message = "message" /// Key for the message in API responses (e.g., "Login successful").
    static let payload = "payload" /// Key for the payload data in API responses (e.g., user data).

}


class UDManager {
    class func UDSET(_ data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        //        UserDefaults.standard.synchronize() //last updat...unusing of swiftui
    }
    
    class func UDValue( key: String) -> Any {
       return UserDefaults.standard.value(forKey: key) as Any
    }
    
//    static func UDRecavaryData(forKey key: String) -> String {
//        return UserDefaults.standard.string(forKey: key) ?? ""
//    }

    
    class func UDValueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    class func UDValueTrueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    
    class func UDRemove( key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        //        UserDefaults.standard.synchronize() //last updat...unusing of swiftui
        
        //// clearAll data
        //    static func clearAll() {
        //        if let bundleID = Bundle.main.bundleIdentifier {
        //            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        //        }
        //    }
        
    }
}



/*
 
 // --------------- MARK: - Update code ----------------
 import SwiftUI

 struct AppC2onstants {
     static let AppName = "Online Groceries"
     
     static let BASE_URL = "http://localhost:3001/api/app/"
     
     struct UserDefaultsKeys {
         /// Key for storing user payload in UserDefaults.
         static let userPayload = "user_payload"
         /// Key for storing user login status in UserDefaults.
         static let userLogin = "user_login"
     }
     
     
     // MARK: - API Endpoints
     
     struct APIEndpoints {
         static let BASE_URL = "http://localhost:3001/api/app/"
         
         // MARK: - Authentication
         static let login = BASE_URL + "login"
         static let signUp = BASE_URL + "sign_up"
         
         // MARK: - User
         static let userPayload = "user_payload"
         static let userLogin = "user_login"
         
         // MARK: - Home & Products
         static let home = BASE_URL + "home"
         static let productDetail = BASE_URL + "product_detail"
         
         // MARK: - Favorites
         static let addRemoveFavorite = BASE_URL + "add_remove_favorite"
         static let favoriteList = BASE_URL + "favorite_list"
         
         // MARK: - Cart
         static let addToCart = BASE_URL + "add_to_cart"
         static let updateCart = BASE_URL + "update_cart"
         static let removeFromCart = BASE_URL + "remove_cart"
         static let cartList = BASE_URL + "cart_list"
         
         // MARK: - Orders
         static let placeOrder = BASE_URL + "order_place"
         static let myOrdersList = BASE_URL + "my_order"
         static let myOrdersDetail = BASE_URL + "my_order_detail"
         
         // MARK: - Addresses
         static let addAddress = BASE_URL + "add_delivery_address"
         static let updateAddress = BASE_URL + "update_delivery_address"
         static let removeAddress = BASE_URL + "delete_delivery_address"
         static let addressList = BASE_URL + "delivery_address"
         
         // MARK: - Payment
         static let addPaymentMethod = BASE_URL + "add_payment_method"
         static let removePaymentMethod = BASE_URL + "remove_payment_method"
         static let paymentMethodList = BASE_URL + "payment_method"
         
         // MARK: - Promo Codes
         static let promoCodeList = BASE_URL + "promo_code_list"
         
         // MARK: - Explore
         static let exploreCategories = BASE_URL + "explore_category_list"
         static let exploreItemsList = BASE_URL + "explore_category_items_list"
         
         // MARK: - Notifications
         static let notificationList = BASE_URL + "notification_list"
         static let readAllNotifications = BASE_URL + "notification_read_all"
         
         // MARK: - Profile
         static let updateProfile = BASE_URL + "update_profile"
         static let changePassword = BASE_URL + "change_password"
         
         // MARK: - Forgot Password
         static let forgotPasswordRequest = BASE_URL + "forgot_password_request"
         static let forgotPasswordVerify = BASE_URL + "forgot_password_verify"
         static let setNewPassword = BASE_URL + "forgot_password_set_password"
     }
 }
 */





