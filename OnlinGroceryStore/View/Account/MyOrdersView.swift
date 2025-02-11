//
//  MyOrdersView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 11/02/2025.
//

import SwiftUI

import SwiftUI

struct MyOrdersView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: DeliveryAddressModel) -> () )?
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach( addressVM.listArr , id: \.id, content: {
                        aObj in
                        
                        HStack(spacing: 15) {
                            VStack{
                                HStack {
                                    Text(aObj.name)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Text(aObj.typeName)
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primaryText)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.secondaryText.opacity(0.3))
                                        .cornerRadius(5)
                                }
                                
                                Text("\(aObj.address),\(aObj.city), \(aObj.state), \(aObj.postalCode) ")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(aObj.phone)
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            VStack{
                                
                                Spacer()
                                
                            // MARK: Update DeliveryAddress
                                NavigationLink {
                                    AddDeliveryAddressView(isEdit: true, editObj: aObj  )
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.primaryApp)
                                }
                                .padding(.bottom, 8)

                               
                                // MARK: Remove DeliveryAddress
                                Button {
                                    addressVM.serviceCallRemove(aObj: aObj)
                                } label: {
                                    Image("close")
                                        .resizable()
                                        
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                
                                Spacer()

                            }
                        }
                        .padding(25)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker) {
                                dismiss()
                                didSelect?(aObj)
                            }
                        }


                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)

            }
            
            
            VStack {
                    
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    NavigationLink {
                        AddDeliveryAddressView()
                    } label: {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 8)
                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
            
            
        }
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        MyOrdersView()
    }
}
