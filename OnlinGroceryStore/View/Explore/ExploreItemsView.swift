//
//  ExploreItemView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var ExploreVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var colums =  [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    
    var body: some View {
        ZStack{
            
                HStack{
                    backButton(action: dismiss)
                    
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
//                        .frame(height: 46)
                    
                    shareButton {
                        
                    }
                    
                    
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreItemsView()
}
