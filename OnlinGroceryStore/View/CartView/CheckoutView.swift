//
//  CheckoutView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 06/02/2025.
//


import SwiftUI

struct CheckoutView: View {
    @Binding var isShow: Bool
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        
        VStack {
            
            Spacer()
            VStack {
                HStack{
                    Text("Checkout")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Button {
                        $isShow.wrappedValue = false
                    }label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                    }
                    
                }
                .padding(.top, 30)
                
                Divider()
                
                HStack{
                    Text("Delivary Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    
                    Spacer()
                    
                    Picker("", selection: $cartVM.deliveryType) {
                        Text("Delivary").tag(1)
                        Text("Collection").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 180)
                    
                }
                
                Divider()
                
                if (cartVM.deliveryType == 1) {
                    NavigationLink{
                        DelieryAddressView(isPicker: true) { aObj in
                            cartVM.deliveryObj = aObj
                        }
                    } label: {
                        HStack{
                            Text("Delivary")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.secondaryText)
                                .frame(height: 46)
                            
                            
                            Spacer()
                            
                            Text(cartVM.deliveryObj?.name ?? "Select Method ")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.primaryText)
                        }
                    }
                    
                    
                    Divider()
                }
                
                
                HStack{
                    Text("Payment Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    
                    Spacer()
                    
                    Picker("Select Payment", selection: $cartVM.paymentType) {
                        Text("COD").tag(1)
                        Text("Online").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 150)
                    
                }
                Divider()
                
                if (cartVM.paymentType == 2) {
                    NavigationLink{
                        PaymentMethodsView(isPicker: true) { pObj in
                            cartVM.paymentObj = pObj
                        }
                    } label: {
                        HStack{
                            Text("Payment")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.secondaryText)
                                .frame(height: 46)
                            
                            Spacer()
                            
                            Image("master")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                            
                            Text(cartVM.paymentObj?.cardNumber ?? "Select")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.primaryText)
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                    Divider()
                }
                
                
                NavigationLink{
                    PromoCodeView(isPicker: true) { pObj in
                        cartVM.promoCodeObj = pObj
                    }
                }label: {
                    HStack {
                        Text("Promo Code")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 46)
                        
                        Spacer()
                        
                        Text(cartVM.promoCodeObj?.code ?? "Pick Discount")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .frame(height: 46)
                        
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primaryText)
                    }
                }
                
                Divider()
                
                VStack{
                    
                    HStack{
                        Text("Total")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        
                        Text("$ \(cartVM.totalProductsCost)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack{
                        Text("Delivery Cost")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        
                        Text(" + $ \(cartVM.deliverCost)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack{
                        Text("DisCount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text("- $ \(cartVM.discount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.red)
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack{
                    Text("Final Total")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("$ \(cartVM.finalTotalCost)")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Button {
                        
                    }label: {
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primaryText)
                    }
                }
                //                    .padding()
                
                
                Divider()
                
                VStack (alignment: .leading){
                    Text("By continuing, you agree to our")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    
                    HStack {
                        Text("Terms of Service")
                            .font(.customfont(.semibold, fontSize: 14))
                        
                        Text("and")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.secondaryText)
                        
                        Text("Privacy Policy.")
                            .font(.customfont(.semibold, fontSize: 14))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        Spacer()
                    }
                    
                }
                .padding(.vertical, .screenWidth * 0.03)
                
                RoundButton(title: "Place Order") {
                    cartVM.serviceCallOrderPlace()
                }
                .padding(.bottom, .bottomInsets + 70)
                
            }
            .padding(.horizontal, 20)
            . background(.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
            
        }
    }
}

#Preview {
    @State var isShow: Bool = false
    NavigationView{
        CheckoutView(isShow: $isShow)
        
    }
}


// MARK: SubbViews:
// var DeliveryView , var PaymentView, headderView
