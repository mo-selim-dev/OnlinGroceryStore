//
//  OnlinGroceryStoreApp.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 13/01/2025.
//

import SwiftUI

@main
struct OnlinGroceryStoreApp: App {
    @StateObject var mainVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()

                }
            }
            
            
        }
    }
}
