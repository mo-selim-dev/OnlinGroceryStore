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

    
        // MARK: - serviceCallList

    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.favoriteList, isToken: true ) { responseObj in
             
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
                    
                }else{
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Invalid response from server"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Network request failed"
            self.showError = true
        }
    }

    
}





