////
////  DeliveryAddressViewModel.swift
////  OnlinGroceryStore
////
////  Created by Mohamed Selim on 05/02/2025.
////
//
//
//import SwiftUI
//
//class DeliveryAddressViewModel: ObservableObject
//{
//    static var shared: DeliveryAddressViewModel = DeliveryAddressViewModel()
//    
//    
//    @Published var txtName: String = ""
//    @Published var txtMobile: String = ""
//    @Published var txtAddress: String = ""
//    @Published var txtCity: String = ""
//    @Published var txtState: String = ""
//    @Published var txtPostalCode: String = ""
//    @Published var txtTypeName: String = "Home"
//    
//    
//    @Published var showError = false
//    @Published var errorMessage = ""
//    
//    @Published var listArr: [AddressModel] = []
//    
//    
//    init() {
//        serviceCallList()
//    }
//    
//    func clearAll(){
//        txtName = ""
//        txtMobile = ""
//        txtAddress = ""
//        txtCity = ""
//        txtState = ""
//        txtPostalCode = ""
//        txtTypeName = "Home"
//    }
//    
//    func setData(aObj: AddressModel) {
//        txtName = aObj.name
//        txtMobile = aObj.phone
//        txtAddress = aObj.address
//        txtCity = aObj.city
//        txtState = aObj.state
//        txtPostalCode = aObj.postalCode
//        txtTypeName = aObj.typeName
//    }
//    
//    
//    
//    
//    //MARK: ServiceCall
//    
//    func serviceCallList(){
//        ServiceCall.post(parameter: [:], path: Globs.Endpoints.addressList, isToken: true ) { responseObj in
//            if let response = responseObj as? NSDictionary {
//                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
//                    
//                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
//                        return AddressModel(dict: obj as? NSDictionary ?? [:])
//                    })
//                
//                }else{
//
//                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//    }
//    
//    
//    
//    func serviceCallUpdateAddress( aObj: AddressModel?, didDone: (( )->())? ) {
//        ServiceCall.post(parameter: ["address_id":  aObj?.id ?? "", "name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode ], path: Globs.Endpoints.updateAddress, isToken: true ) { responseObj in
//            if let response = responseObj as? NSDictionary {
//                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
//                    self.clearAll()
//                    self.serviceCallList()
//                    didDone?()
//                }else{
//                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//
//    }
//    
//    
//    
//    func serviceCallRemove(aObj: AddressModel){
//        ServiceCall.post(parameter: ["address_id": aObj.id], path: Globs.Endpoints.removeAddress, isToken: true ) { responseObj in
//            if let response = responseObj as? NSDictionary {
//                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
//
//                    self.serviceCallList()
//                
//                }else{
//                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//    }
//    
// 
//    
//    func serviceCallAddAddress(didDone: (()->())? ) {
//        ServiceCall.post(parameter: ["name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode  ], path: Globs.Endpoints.addAddress, isToken: true ) { responseObj in
//            if let response = responseObj as? NSDictionary {
//                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
//                    self.clearAll()
//                    self.serviceCallList()
//                    didDone?( )
//                }else{
//                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//
//    }
//    
//    
//    
//}







import SwiftUI

class DeliveryAddressViewModel: ObservableObject
{
    static var shared: DeliveryAddressViewModel = DeliveryAddressViewModel()
    
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtAddress: String = ""
    @Published var txtCity: String = ""
    @Published var txtState: String = ""
    @Published var txtPostalCode: String = ""
    @Published var txtTypeName: String = "Home"
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [DeliveryAddressModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    func clearAll(){
        txtName = ""
        txtMobile = ""
        txtAddress = ""
        txtCity = ""
        txtState = ""
        txtPostalCode = ""
        txtTypeName = "Home"
    }
    
    func setData(aObj: DeliveryAddressModel) {
        txtName = aObj.name
        txtMobile = aObj.phone
        txtAddress = aObj.address
        txtCity = aObj.city
        txtState = aObj.state
        txtPostalCode = aObj.postalCode
        txtTypeName = aObj.typeName
    }
    
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.addressList, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    
                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return DeliveryAddressModel(dict: obj as? NSDictionary ?? [:])
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
    
    func serviceCallRemove(aObj: DeliveryAddressModel){
        ServiceCall.post(parameter: ["address_id": aObj.id ], path: Globs.Endpoints.removeAddress, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.serviceCallList()
                
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
    
    func serviceCallUpdateAddress( aObj: DeliveryAddressModel?, didDone: (( )->())? ) {
        ServiceCall.post(parameter: ["address_id":  aObj?.id ?? "", "name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode ], path: Globs.Endpoints.updateAddress, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
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
    
    func serviceCallAddAddress(didDone: ((  )->())? ) {
        ServiceCall.post(parameter: ["name":  txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode  ], path: Globs.Endpoints.addAddress, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?( )
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
