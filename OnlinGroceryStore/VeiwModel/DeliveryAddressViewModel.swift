//
//  DeliveryAddressViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 05/02/2025.
//


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
    
    @Published var listArr: [AddressModel] = []
    
    
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
    
    func setData(aObj: AddressModel) {
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
        
    }
    
    func serviceCallRemove(cObj: AddressModel){
        
    }
    
    func serviceCallUpdateAddress( aObj: AddressModel?, didDone: (( )->())? ) {

    }
    
    func serviceCallAddAddress(didDone: ((  )->())? ) {
        
    }
    
    
}
