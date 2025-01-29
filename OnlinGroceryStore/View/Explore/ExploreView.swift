//
//  ExploreView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 23/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var ExploreCategoryVM = ExploreCategoryViewModel.shared
    @State var txtSearch: String = ""
    
    var coloms = [
        GridItem(.flexible(minimum: 150))
    ]
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Text("Find Products")
                        .font(.customfont(.semibold, fontSize: 25))
                        .padding()
                    SearchTextField(placholder: "Search Store", txt: $txtSearch)
                    Spacer()

                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 4)
            }
            


            
        }
        
    }
}

#Preview {
    ExploreView()
}
