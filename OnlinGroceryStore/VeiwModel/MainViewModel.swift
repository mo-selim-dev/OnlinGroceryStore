//
//  MainViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 15/01/2025.

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    static let shared = MainViewModel()
    
    @Published var txtUsername: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserModel?
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    init() {

        if( UserDefaultsManager.getBool(forKey: AppConstants.API.UserDefaultsKeys.userLogin) ) {
            // User Login
            self.setUserData(userDict: UserDefaultsManager.getValue(forKey: AppConstants.API.UserDefaultsKeys.userPayload) as? [String : Any] ?? [:] )
        }else{
            // User Not Login
        }
        
#if DEBUG
        txtUsername = "test2"
        txtEmail = "test@gmail.com"
        txtPassword = "123456"
#endif
    }
    
    // MARK: - Login
    
    func serviceCallLogin() {
        // Validate input fields
        if(!txtEmail.isValidEmail) {
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty) {
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
        }
        
        // Prepare parameters
        let parameters: [String: Any] = [
            "email": txtEmail,
            "password": txtPassword,
            "dervice_token": ""
        ]
        
        // Make the network request
        ServiceCall.post(parameter: parameters as NSDictionary, path: AppConstants.API.Endpoints.login) { [weak self] responseObj in
            guard let self = self else { return }
            
            if let response = responseObj{
                // Parse the response
                let status = response["status"] as? String ?? ""
                let message = response["message"] as? String ?? "An unknown error occurred"
                
                DispatchQueue.main.async {
                    if status == "1" {
                        // Success
                        print("Login successful: \(response)")
                        
                        self.setUserData(userDict: response.value(forKey: ResponseKeys.message) as? [String : Any] ?? [:])
                        
                        //// Show success message
                        //  self.showError(message: message)
                    } else {
                        // Failure
                        self.showError(message: message)
                    }
                }
            } else {
                // Invalid response format
                DispatchQueue.main.async {
                    self.showError(message: "Invalid response from server")
                }
            }
        } failure: { [weak self] error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.showError(message: error?.localizedDescription ?? "Network request failed")
            }
        }
    }
    
    // MARK: - Sign Up
    
    func serviceCallSignUp() {
        
        // Validate input fields
        if(txtUsername.isEmpty) {
            self.errorMessage = "please enter valid username"
            self.showError = true
            return
        }
        
        
        if(!txtEmail.isValidEmail) {
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty) {
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
        }
        
        // Prepare parameters
        let parameters: [String: Any] = [
            "username": txtUsername,
            "email": txtEmail,
            "password": txtPassword,
            "dervice_token": ""
        ]
        
        // Make the network request
        ServiceCall.post(parameter: parameters as NSDictionary, path: AppConstants.API.Endpoints.login) { [weak self] responseObj in
            guard let self = self else { return }
            
            if let response = responseObj {
                // Parse the response
                let status = response["status"] as? String ?? ""
                let message = response["message"] as? String ?? "An unknown error occurred"
                
                DispatchQueue.main.async {
                    if status == "1" {
                        // Success
                        print("Signup successful: \(response)")
                        
                        self.setUserData(userDict: response.value(forKey: ResponseKeys.message) as? [String : Any] ?? [:])
                        
                        //// Show success message
                        // self.showError(message: message)
                    } else {
                        // Failure
                        self.showError(message: message)
                    }
                }
            } else {
                // Invalid response format
                DispatchQueue.main.async {
                    self.showError(message: "Invalid response from server")
                }
            }
        } failure: { [weak self] error in // ?
            guard let self = self else { return }  // ?
            
            DispatchQueue.main.async {
                self.showError(message: error?.localizedDescription ?? "Network request failed")
            }
        }
    }
    
    // MARK: - Helper Methods
    
    /// Displays an error message.
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
    
    //  var userDict = response.value(forKey: ResponseKeys.message) ?? [:]
    //  UserDefaultsManager.set(userDict, forKey: AppConstants.API.UserDefaultsKeys.userPayload)
    //  UserDefaultsManager.set(true, forKey: AppConstants.API.UserDefaultsKeys.userLogin)
    func setUserData(userDict: [String: Any]) {
        // Save user data to UserDefaults
        UserDefaultsManager.saveValue(userDict, forKey: AppConstants.API.UserDefaultsKeys.userPayload)
        UserDefaultsManager.saveValue(true, forKey: AppConstants.API.UserDefaultsKeys.userLogin)
        
        // Update user object and login status
        self.userObj = UserModel(dictionary: userDict)
        self.isUserLogin = true
        
        // Clear input fields
        clearInputFields()
    }
    
    /// Clears all input fields and resets the password visibility.
    private func clearInputFields() {
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
    }
    
    
    
    
} // end MainViewModel
