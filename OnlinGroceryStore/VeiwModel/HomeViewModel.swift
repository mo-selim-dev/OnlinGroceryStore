//
//  HomeViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 23/01/2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
}

 
