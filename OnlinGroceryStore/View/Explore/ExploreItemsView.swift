////
////  ExploreItemView.swift
////  OnlinGroceryStore
////
////  Created by Mohamed Selim on 29/01/2025.
////
//
//import SwiftUI
//
//struct ExploreItemsView: View {
//    @Environment(\.dismiss) var dismiss
//    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [:]))
//
//    var columns =  [
//        GridItem(.flexible(), spacing: 15),
//        GridItem(.flexible(), spacing: 15)
//    ]
//    
//    
//    var body: some View {
//        ZStack{
//            
//            VStack {
//                CustomAppBar(
//                    colorAppBar: .white,
//                    
//                    leftIcon: "back",
//                    leftAction: {
//                        dismiss()
//                                },
//                    leftIconSize: 25,
//                    
//                    rightIcon: "filter_ic",
//                    rightAction: {
//                        print("Right icon tapped")
//                    },
//                    rightIconSize: 25,
//
//                    
//                    title: "Frash Fruits & Vegetable",
//                    textAlignment: .center,
////                    font: .system(size: 20, weight: .bold),
//                    font: .customfont(.bold, fontSize: 20)
//                    
//                )
//                
//                if !itemsVM.listArr.isEmpty {
//                    ScrollView {
//                        LazyVGrid(columns: columns, spacing: 15) {
//                            ForEach(itemsVM.listArr, id: \.id) { pObj in
//                                ProductCell(pObj: pObj, width: .infinity) {
//                                    // Action on product cell
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 10)
//                        .padding(.bottom, .bottomInsets + 60)
//                    }
//                } else {
//                    Text("Loading...") // Show a loading indicator until data is available
//                }
//                
//            }
//            .navigationBarBackButtonHidden(true)
//
//        }
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
//        "cat_id": 1,
//        "cat_name": "Frash Fruits & Vegetable",
//        "image": "http://192.168.1.3:3001/img/category/20230726155407547qM5gSxkrCh.png",
//        "color": "53B175"
//    ])))
//}

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel (dict: [:]))
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Button {
                        dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    
                    Text(itemsVM.cObj.name)
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Image("filter_ic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                }
                
                
                
                
                ScrollView {
                    LazyVGrid(columns: columns,  spacing:15) {
                        ForEach(itemsVM.listArr, id: \.id) {
                            pObj in
                            ProductCell( pObj: pObj, width: .infinity ) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, message in
                                    self.itemsVM.errorMessage = message
                                    self.itemsVM.showError = true
                                }
                            }
                            
                            
                        }
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $itemsVM.showError, content: {
            Alert(title: Text(Globs.appName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        //        .animation(.easeInOut, value: cartVM.showCheckout)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ExploreItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
                "cat_id": 1,
                "cat_name": "Frash Fruits & Vegetable",
                "image": "http://192.168.1.3:3001/img/category/20230726155407547qM5gSxkrCh.png",
                "color": "53B175"
            ] ) ))
        }
        
    }
}
