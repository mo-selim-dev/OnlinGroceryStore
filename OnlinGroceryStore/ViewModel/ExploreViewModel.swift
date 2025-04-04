//
//  FavouriteViewModel 2.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 28/01/2025.
//



import SwiftUI

class ExploreViewModel: ObservableObject
{
    static var shared: ExploreViewModel = ExploreViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ExploreCategoryModel] = []
    
    
    init() {
        serviceCallList()
    }
    
        // MARK: - ExploreView

    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.exploreCategoryList, isToken: true ) { responseObj in
             
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return ExploreCategoryModel(dict: obj as? NSDictionary ?? [:])
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





