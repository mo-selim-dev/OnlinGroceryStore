//
//  ProductDetail.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 26/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
//    @ObservedObject var detailVM = ProductDetailVeiwModel.shared
    @StateObject var detailVM = ProductDetailViewModel(prodObj: ProductModel(dict: [:]))
    
    var body: some View {
        
        ZStack{

                ScrollView{
                    ZStack(alignment: .top) { // تعديل بسيط هنا لتحديد محاذاة العناصر في الأعلى

                        Rectangle()
                            .foregroundColor( Color(hex: "F2F2F2") )
                            .frame(width: .screenWidth, height: .screenWidth * 0.8)
                            .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                        
                        WebImage(url: URL(string: detailVM.pObj.image ))
                            .resizable()
                            .indicator(.activity) // Activity Indicator
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                        
                            CustomAppBar(
                                leftIcon: "back", leftAction: { dismiss() }
                                , rightIcon: "share", rightAction: { }
                            )

                        
                    }
                    .frame(width: .screenWidth, height: .screenWidth * 0.8)
                    
                    VStack{
                        HStack{
                            Text(detailVM.pObj.name)
                                .font(.customfont(.bold, fontSize: 24))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Button {
                                //                        detailVM.serviceCallAddRemoveFav()
                                detailVM.isFav.toggle()
                            } label: {
                                
                                Image( detailVM.isFav ? "favorite" : "fav"  )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            .foregroundColor(Color.secondaryText)
                            
                        }
                        Text("\(detailVM.pObj.unitValue)\(detailVM.pObj.unitName), Price")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            
                            Button {
                                //                        detailVM.addSubQTY(isAdd: false)
                                detailVM.updateQty(isIncrement: false)
                                
                            } label: {
                                
                                Image( "subtack"  )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            Text( "\(detailVM.qty)" )
                                .font(.customfont(.bold, fontSize: 24))
                                .foregroundColor(.primaryText)
                                .multilineTextAlignment(.center)
                                .frame(width: 45, height: 45, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                                )
                            
                            Button {
                                detailVM.updateQty(isIncrement: true)
                            } label: {
                                
                                Image( "add_green"  )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            Spacer()
                            Text( "$\(  (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f")"  )
                                .font(.customfont(.bold, fontSize: 28))
                                .foregroundColor(.primaryText)
                            
                        }
                        .padding(.vertical, 8)
                        
                        Divider()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    VStack{
                        HStack{
                            Text("Product Detail")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Button {
                                withAnimation(.snappy) {
                                    detailVM.showDetails()
                                }
                                
                            } label: {
                                
                                Image( detailVM.isShowDetails ? "detail_open" : "next"  )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .padding(15)
                            }
                            .foregroundColor(Color.primaryText)
                            
                        }
                        
                        if(detailVM.isShowDetails) {
                            Text(detailVM.pObj.detail)
                                .font(.customfont(.medium, fontSize: 13))
                                .foregroundColor(.secondaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom , 8)
                        }
                        
                        
                        Divider()
                    }
                    .padding(.horizontal, 20)
                    
                    VStack{
                        HStack{
                            Text("Nutritions")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            
                            Text(detailVM.pObj.nutritionWeight)
                                .font(.customfont(.semibold, fontSize: 10))
                                .foregroundColor(.secondaryText)
                                .padding(8)
                                .background( Color.placeholder.opacity(0.5) )
                                .cornerRadius(5)
                            
                            Button {
                                withAnimation {
                                    detailVM.showNutrition()
                                }
                                
                            } label: {
                                
                                Image( detailVM.isShowNutrition ? "detail_open" : "next"  )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .padding(15)
                            }
                            .foregroundColor(Color.primaryText)
                            
                        }
                        
                        if(detailVM.isShowNutrition) {
                            LazyVStack {
                                
                                ForEach( detailVM.nutritionArr , id: \.id) { nObj in
                                    HStack{
                                        Text( nObj.nutritionName )
                                            .font(.customfont(.semibold, fontSize: 15))
                                            .foregroundColor(.secondaryText)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        
                                        Text( nObj.nutritionValue )
                                            .font(.customfont(.semibold, fontSize: 15))
                                            .foregroundColor(.primaryText)
                                    }
                                    
                                    Divider()
                                }
                                .padding(.vertical, 0)
                                
                                
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        
                        Divider()
                    }
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: 2){
                        Text("Review")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            ForEach(1...5, id: \.self) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.orange)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    RoundButton(title: "Add To Basket") {
                        CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                            
                            detailVM.qty = 1
                            
                            self.detailVM.errorMessage = msg
                            self.detailVM.showError = true
                        }
                    }
                    .padding( 20)
                    
                }
                
            
                //        backButton(action: dismiss)
                //        shareButton {
                //        }

                
                
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.appName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
        
                        "prod_id": 7,
                        "cat_id": 1,
                        "brand_id": 1,
                        "type_id": 1,
                        "name": "Oranges",
                        "detail": "Many types of oranges are high in fiber and beneficial vitamins, like vitamin C. They also contain antioxidants which can have various health benefits, including supporting immune function.",
                        "unit_name": "kg",
                        "unit_value": "1",
                        "nutrition_weight": "140g",
                        "price": 0.99,
                        "image": "http://localhost:3001/img/product/202307310958175817ytVf7AVIOl.png",
                        "cat_name": "Frash Fruits & Vegetable",
                        "type_name": "Pulses",
                        "is_fav": 0,
                        "avg_rating": 0
        
    ])))
}
