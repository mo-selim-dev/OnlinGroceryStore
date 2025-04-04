//
//  PromoCodeViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 06/02/2025.
//

import SwiftUI

class PromoCodeViewModel: ObservableObject
{
    static var shared: PromoCodeViewModel = PromoCodeViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [PromoCodeModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.promoCodeList, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return PromoCodeModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
                }else{
                    
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    
    }
