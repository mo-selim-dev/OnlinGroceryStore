//
//  ContentView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 31/01/2025.
//


import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
            NavigationView {
                VStack {
                    Text("Welcome to the main screen!")
                    // محتوى الشاشة الرئيسية
                }
                .navigationTitle("My Custom Title") // تخصيص العنوان
                .foregroundStyle(.blue)
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Open search
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if isLoggedIn {
                            Button("Logout") {
                                // Logout action
                            }
                        } else {
                            Button("Login") {
                                // Login action
                            }
                        }
                    }
                }
                
                
            }

        
    }
}


#Preview {
    ContentView()
}
