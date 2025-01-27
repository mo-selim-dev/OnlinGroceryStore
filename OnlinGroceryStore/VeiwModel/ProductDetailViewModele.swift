//
//  ProductDetailVeiwModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 26/01/2025.
//

import SwiftUI

class ProductDetailViewModele: ObservableObject
{
//    static var shared: ProductDetailViewModel = ProductDetailViewModel()

    @Published var pObj: ProductModel! = ProductModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var nutritionArr: [NutritionModel] = []
    @Published var imageArr: [ImageModel] = []
    
    @Published var isFav: Bool = false
    @Published var isShowDetails: Bool = false
    @Published var isShowNutrition: Bool = false
    @Published var quantity: Int = 0

    func showDetails(){
        isShowDetails = !isShowDetails
    }
    
    func showNutrition(){
        isShowDetails = !isShowDetails
    }
    
    func updateQuantity(isIncrement: Bool = true) {
        if(isIncrement){
            quantity += 1
            if quantity > 99 {
                quantity = 99
            }
        }else{
            quantity -= 1
        }
    }
    

    
    init(prodObj: ProductModel) {
        self.pObj = prodObj
        self.isFav = prodObj.isFav
        serviceCallDetail()

    }

    
        // MARK: - ProductDetailVeiw

    func serviceCallDetail(){
        ServiceCall.post(parameter: ["prod_id": self.pObj.prodId], path: Globs.Endpoints.productDetail, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: ResponseKeys.payload) as? NSDictionary {
  
                        self.pObj = ProductModel(dict: payloadObj)
                        
                        self.nutritionArr = (payloadObj.value(forKey: "nutrition_list") as? NSArray ?? []).map({ obj in
                            
                            return NutritionModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.imageArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({ obj in
                            
                            return ImageModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
                    
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


