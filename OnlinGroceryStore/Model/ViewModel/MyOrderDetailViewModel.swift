//
//  MyOrderDetailViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 11/02/2025.
//


import SwiftUI

class MyOrderDetailViewModel: ObservableObject {
    @Published var pObj: MyOrderModel = MyOrderModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr: [OrderItemModel] = []
    
    @Published var txtMessage = ""
    @Published var rating: Int = 0
    @Published var shoWriteRwview = false
    @Published var productObj: OrderItemModel?
    
    
    init(prodObj: MyOrderModel) {
        self.pObj = prodObj
        serviceCallDetail()
    }
    
    //MARK: Action
    func actionWriteReview(obj: OrderItemModel){
        rating = 5
        txtMessage = ""
        productObj = obj
        shoWriteRwview = false
    }
    
    //MARK: ServiceCall
    
    //    func serviceCallDetail(){
    //        ServiceCall.post(parameter: ["order_id": self.pObj.id ], path: Globs.Endpoints.myOrdersDetail, isToken: true ) { responseObj in
    //            if let response = responseObj as? NSDictionary {
    //                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
    //
    //                    if let payloadObj = response.value(forKey: ResponseKeys.payload) as? NSDictionary {
    //                        //                        print("Payload Object: \(payloadObj)")
    //                        guard payloadObj is [String: Any] else {
    //                            print("Error: Invalid payload object")
    //                            self.errorMessage = "Invalid data format"
    //                            self.showError = true
    //                            return
    //                        }
    //                        self.pObj = MyOrderModel(dict: payloadObj)
    //                        self.listArr = (payloadObj.value(forKey: "cart_list") as? NSArray ?? []).map({ obj in
    //
    //                            print(obj)
    //                            return OrderItemModel(dict: obj as? NSDictionary ?? [:])
    //                        })
    //                    }
    //
    //
    //                }else{
    //                    print("Error: Payload object is nil or invalid")
    //                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
    //                    self.showError = true
    //                }
    //            }
    //        } failure: { error in
    //            self.errorMessage = error?.localizedDescription ?? "Fail"
    //            self.showError = true
    //        }
    //    }
    
    
    func serviceCallDetail(){
        ServiceCall.post(parameter: ["order_id": self.pObj.id ], path: Globs.Endpoints.myOrdersDetail, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: ResponseKeys.payload) as? NSDictionary {
                        
                        guard let validPayloadObj = payloadObj as? [String: Any] else {
                            print("Error: Invalid payload object")
                            self.errorMessage = "Invalid data format"
                            self.showError = true
                            return
                        }
                        
                        self.pObj = MyOrderModel(dict: validPayloadObj as NSDictionary)
                        
                        self.listArr = (payloadObj.value(forKey: "cart_list") as? NSArray ?? []).map({ obj in
                            print(obj)
                            return OrderItemModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                    } else {
                        print("Error: Payload object is nil or invalid")
                        self.errorMessage = "Invalid payload object"
                        self.showError = true
                    }
                    
                } else {
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    func serviceCallWriteReview(didDone: (()-> ())? ) {
        ServiceCall.post(parameter: [ "order_id": self.pObj.id, "prod_id": self.productObj?.prodId ?? "", "rating": rating, "review_message": txtMessage ], path: Globs.Endpoints.productRatingReview) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.shoWriteRwview = false
                    didDone?()
                    
                    self.serviceCallDetail()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "success"
                        self.showError = true
                    }
                    
                } else {
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
