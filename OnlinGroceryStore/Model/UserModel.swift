//
//  UserModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 19/01/2025.
//


import SwiftUI
import Foundation

// MARK: - UserModel
struct UserModel: Identifiable, Equatable, Codable {
    var id: Int
    var username: String
    var name: String
    var email: String
    var mobile: String
    var mobileCode: String
    var authToken: String

    ////or
    // Custom initializer for dictionary parsing
//    init(dictionary: NSDictionary) {
//        self.id = dictionary.value(forKey: "user_id") as? Int ?? 0
//        self.username = dictionary.value(forKey: "username") as? String ?? ""
//        self.name = dictionary.value(forKey: "name") as? String ?? ""
//        self.email = dictionary.value(forKey: "email") as? String ?? ""
//        self.mobile = dictionary.value(forKey: "mobile") as? String ?? ""
//        self.mobileCode = dictionary.value(forKey: "mobile_code") as? String ?? ""
//        self.authToken = dictionary.value(forKey: "auth_token") as? String ?? ""
//    }
    init(dictionary: [String: Any]) {
        self.id = dictionary["user_id"] as? Int ?? 0
        self.username = dictionary["username"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.mobile = dictionary["mobile"] as? String ?? ""
        self.mobileCode = dictionary["mobile_code"] as? String ?? ""
        self.authToken = dictionary["auth_token"] as? String ?? ""
    }

    // Equatable conformance
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
}

///or
//
//import SwiftUI
//import Foundation
//
//// MARK: - UserModel
//struct UserModel: Identifiable, Equatable, Codable {
//    var id: Int
//    var username: String
//    var name: String
//    var email: String
//    var mobile: String
//    var mobileCode: String
//    var authToken: String
//
//    // MARK: - CodingKeys
//    enum CodingKeys: String, CodingKey {
//        case id = "user_id"
//        case username
//        case name
//        case email
//        case mobile
//        case mobileCode = "mobile_code"
//        case authToken = "auth_token"
//    }
//
//    // MARK: - Equatable Conformance
//    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//



// MARK: - UserDefaultsManager
class UserDefaultsManager {

    static func saveValue(_ value: Any, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func getValue(forKey key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }

    //// recavary data
//    static func getString(forKey key: String) -> String {
//        return UserDefaults.standard.string(forKey: key) ?? ""
//    }

    static func getBool(forKey key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    static func getBoolDefaultTrue(forKey key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) as? Bool ?? true
    }

    static func removeValue(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
//// clearAll data
//    static func clearAll() {
//        if let bundleID = Bundle.main.bundleIdentifier {
//            UserDefaults.standard.removePersistentDomain(forName: bundleID)
//        }
//    }
}
