//
//  MyOrdersViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 11/02/2025.
//


import SwiftUI

class MyOrdersViewModel: ObservableObject
{
    static var shared: MyOrdersViewModel = MyOrdersViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [MyOrderModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.myOrdersList, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                print("Response received: \(response)") // طباعة الرد
                
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    print("Successful response, processing data.")

                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return MyOrderModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
                    print("Parsed listArr: \(self.listArr)") // طباعة البيانات المحللة
                    
                    if self.listArr.isEmpty {
                        print("No orders found.")
                    }
                
                }else{
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                    print("Error message: \(self.errorMessage)")
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
            print("API call failed with error: \(self.errorMessage)")
        }
    }
    
    
    
    
}


