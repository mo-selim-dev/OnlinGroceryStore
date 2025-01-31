//
//  ExploreItemView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [:]))
    @State var txtSearch: String = ""
    
    var columns =  [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    
    var body: some View {
        ZStack{
            
            VStack {
                CustomAppBar(
//                    colorAppBar: .white,
                    
                    leftIcon: "back",
                    leftAction: {
                        print("Left icon tapped")
                    },
                    leftIconSize: 25,
                    rightIcon: "filter_ic",
                    rightAction: {
                        print("Right icon tapped")
                    },
                    rightIconSize: 25,

                    
                    title: "Frash Fruits & Vegetable",
                    textAlignment: .center,
//                    font: .system(size: 20, weight: .bold),
                    font: .customfont(.bold, fontSize: 20)
                    
                )
                
                ScrollView{
                    LazyVGrid(columns: columns,  spacing:15) {
                         
                        ForEach(itemsVM.listArr, id: \.id) {
                            pObj in
                            ProductCell( pObj: pObj ){
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
   
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
        "cat_id": 1,
        "cat_name": "Frash Fruits & Vegetable",
        "image": "http://192.168.1.3:3001/img/category/20230726155407547qM5gSxkrCh.png",
        "color": "53B175"
    ])))
}
