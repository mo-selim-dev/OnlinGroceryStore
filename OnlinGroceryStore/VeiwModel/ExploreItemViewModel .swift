//
//  ExploreCategoryViewModel 2.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//



import SwiftUI

class ExploreItemViewModel : ObservableObject
{
    static var shared: ExploreItemViewModel  = ExploreItemViewModel ()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ExploreCategoryModel] = []
    
    
    init() {
        serviceCallExploreCategoryItem()
    }
    
        // MARK: - HomeView

    func serviceCallExploreCategoryItem(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.exploreCategoryItemsList, isToken: true ) { responseObj in
             
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





