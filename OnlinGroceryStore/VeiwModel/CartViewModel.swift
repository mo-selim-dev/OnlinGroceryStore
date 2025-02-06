//
//  CartViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 3/02/2025.
//


import SwiftUI

class CartViewModel: ObservableObject
{
    static var shared: CartViewModel = CartViewModel()
    
    @Published var showError = false
//    @Published var showOrderAccept = false
    @Published var errorMessage = ""
    
    @Published var listArr: [CartItemModel] = []
    @Published var total: String = "0.0"
    
//    @Published var showCheckout: Bool = false
//    
//    @Published var showPickerAddress: Bool = false
//    @Published var showPickerPayment: Bool = false
//    @Published var showPickerPromoCode: Bool = false
//    
//    @Published var deliveryType: Int = 1
//    @Published var paymentType: Int = 1
////    @Published var deliverObj: AddressModel?
////    @Published var paymentObj: PaymentModel?
////    @Published var promoObj: PromoCodeModel?
//    
//    @Published var deliverPriceAmount: String = ""
//    @Published var discountAmount: String = ""
//    @Published var userPayAmount: String = ""
    
    
    
    init() {
        serviceCallList()
    }

 
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.cartList, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    self.total = response.value(forKey: "total") as? String ?? "0.0"

                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return CartItemModel(dict: obj as? NSDictionary ?? [:])
                    })
                
                }else{
                    self.total = response.value(forKey: "total") as? String ?? "0.0"

                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    func serviceCallUpdateQty(cObj: CartItemModel, newQty: Int ){
        ServiceCall.post(parameter: ["cart_id": cObj.cartId, "prod_id": cObj.prodId, "new_qty": newQty ], path: Globs.Endpoints.updateCart, isToken: true ) { responseObj in
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
    
    
    func serviceCallRemove(cObj: CartItemModel){
        ServiceCall.post(parameter: ["cart_id": cObj.cartId, "prod_id": cObj.prodId ], path: Globs.Endpoints.removeFromCart, isToken: true ) { responseObj in
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
    
    
    
    
    class func serviceCallAddToCart(prodId: Int, qty: Int, didDone: ((_ isDone: Bool, _ message: String )->())? ) {
        ServiceCall.post(parameter: ["prod_id":  prodId, "qty": qty], path: Globs.Endpoints.addToCart, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    didDone?(true, response.value(forKey: ResponseKeys.message) as? String ?? "Done" )
                }else{
                    didDone?(false, response.value(forKey: ResponseKeys.message) as? String ?? "Fail" )
                }
            }
        } failure: { error in
            didDone?(false,  error?.localizedDescription ?? "Fail" )
        }

    }
    
    
    //    func serviceCallOrderPlace(){
    //
    //        if(deliveryType == 1 && deliverObj == nil ) {
    //            self.errorMessage = "Please select delivery address"
    //            self.showError = true
    //            return
    //        }
    //
    //        if(paymentType == 2 && paymentObj == nil ) {
    //            self.errorMessage = "Please select payment method"
    //            self.showError = true
    //            return
    //        }
    //
    //        ServiceCall.post(parameter: ["address_id": deliveryType == 2 ? "" : "\( deliverObj?.id ?? 0)",
    //                                     "deliver_type": deliveryType,
    //                                     "payment_type": paymentType,
    //                                     "pay_id": paymentType == 1 ? "" : "\( paymentObj?.id ?? 0)",
    //                                     "promo_code_id": promoObj?.id ?? ""  ], path: Globs.SV_ORDER_PLACE, isToken: true ) { responseObj in
    //            if let response = responseObj as? NSDictionary {
    //                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
    //
    //
    //                    self.deliverObj = nil
    //                    self.paymentObj = nil
    //                    self.promoObj = nil
    //                    self.showCheckout = false
    //                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Success"
    //                    self.showError = true
    //                    self.serviceCallList()
    //
    //                    self.showOrderAccept = true
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

    
    
    
}




