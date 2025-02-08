//
//  CheckoutView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 06/02/2025.
//


import SwiftUI

struct CheckoutView: View {
    @Binding var isShow: Bool 
    @State var delivaryType: Int = 1
    @State var paymentType: Int = 1
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
                //                .padding()
                
                Divider()
                
                HStack{
                    Text("Delivary Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    
                    Spacer()
                    
                    Picker("", selection: $delivaryType) {
                        Text("Delivary").tag(1)
                        Text("Collection").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 180)
                    
                    
                }
                //                .padding()
                
                Divider()
                
                if (delivaryType == 1) {
                    HStack{
                        Text("Delivary")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 46)
                        
                        
                        Spacer()
                        
                        Text("Select Method ")
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
                }
                
                
                HStack{
                    Text("Payment Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    
                    Spacer()
                    
                    Picker("Select Payment", selection: $paymentType) {
                        Text("COD").tag(1)
                        Text("Online").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 150)
                    
                }
                //                .padding()
                Divider()
                
                if (paymentType == 1) {
                    HStack{
                        Text("Payment")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 46)
                        
                        
                        Spacer()
                        
                        Button {

                        }label: {
                            Image("master")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                        }
                        
                        Text("Select")
                            .font(.customfont(.semibold, fontSize: 18))
                            .frame(height: 46)
                        
                        
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    //                    .padding()
                    
                    Divider()
                }
                
                
                HStack{
                    Text("Promo Code")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("Pick Discount")
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
                //                .padding()
                
                Divider()
                
                VStack{
                    
                    HStack{
                        Text("Total")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        
                        Text("$ 52.3")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack{
                        Text("Delivery Cost")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        
                        Text(" + $ 2.7")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack{
                        Text("DisCount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        Spacer()
                        Text("- $ 0.0")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.red)
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack{
                    Text("Final Total  ")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("$55.0 ")
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
                    
                }
                .padding(.bottom, .bottomInsets + 15)
                
 
            }
            .padding(.horizontal, 20)
            . background(.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
            
        }
    }
}

#Preview {
    @State var isShow: Bool = false
    CheckoutView(isShow: $isShow)
}


// MARK: SubbViews:
// var DeliveryView , var PaymentView, headderView
