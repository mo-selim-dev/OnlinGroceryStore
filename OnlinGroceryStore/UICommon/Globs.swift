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
        
        // MARK: - Authentication
        static let login = baseURL + "login"
        static let signUp = baseURL + "sign_up"
        
        // MARK: - Home & Products
        static let home = baseURL + "home"
        static let productDetail = baseURL + "product_detail"
        
        // MARK: - Favorites
        static let addRemoveFavorite = baseURL + "add_remove_favorite"
        static let favoriteList = baseURL + "favorite_list"
        
        // MARK: - ExploreCategory
        static let exploreCategoryList = baseURL + "explore_category_list"
        static let exploreCategoryItemsList = baseURL + "explore_category_items_list"
        
        // MARK: - Cart
        static let addToCart = baseURL + "add_to_cart"
        static let updateCart = baseURL + "update_cart"
        static let removeFromCart = baseURL + "remove_cart"
        static let cartList = baseURL + "cart_list"
        
        // MARK: - Orders
        static let placeOrder = baseURL + "order_place"
        static let myOrdersList = baseURL + "my_order"
        static let myOrdersDetail = baseURL + "my_order_detail"
        
        // MARK: - Addresses
        static let addAddress = baseURL + "add_delivery_address"
        static let updateAddress = baseURL + "update_delivery_address"
        static let removeAddress = baseURL + "delete_delivery_address"
        static let addressList = baseURL + "delivery_address"
        
        // MARK: - Promo Codes
        static let promoCodeList = baseURL + "promo_code_list"
        
//        // MARK: - Payment
//        static let addPaymentMethod = baseURL + "add_payment_method"
//        static let removePaymentMethod = baseURL + "remove_payment_method"
//        static let paymentMethodList = baseURL + "payment_method"
//
//        // MARK: - Explore
//        static let exploreCategories = baseURL + "explore_category_list"
//        static let exploreItemsList = baseURL +       "explore_category_items_list"
//
//        // MARK: - Notifications
//        static let notificationList = baseURL + "notification_list"
//        static let readAllNotifications = baseURL + "notification_read_all"
//        
//        // MARK: - Profile
//        static let updateProfile = baseURL + "update_profile"
//        static let changePassword = baseURL + "change_password"
//        
//        // MARK: - Forgot Password
//        static let forgotPasswordRequest = baseURL + "forgot_password_request"
//        static let forgotPasswordVerify = baseURL + "forgot_password_verify"
//        static let setNewPassword = baseURL + "forgot_password_set_password"

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



 
