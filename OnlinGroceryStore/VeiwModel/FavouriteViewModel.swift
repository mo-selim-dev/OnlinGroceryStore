//
//  FavouriteViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 28/01/2025.
//


import SwiftUI

class FavouriteViewModel: ObservableObject
{
    static var shared: FavouriteViewModel = FavouriteViewModel()
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){

    }
    
}
