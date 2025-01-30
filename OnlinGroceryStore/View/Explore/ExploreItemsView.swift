//
//  ExploreItemView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var itemsVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var colums =  [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    
    var body: some View {
        ZStack{
            
            VStack {

                CustomAppBar(
                    leftIcon: Image("back"),
                    leftAction: { print("Left icon tapped") },
                    leftIconSize: 15,
                    leftIconColor: .black,
                    
                    rightIcon: Image(systemName: "gear"),
                    rightAction: { print("Right icon tapped") },
                    rightIconSize: 30,
                    rightIconColor: .blue,
                    
                    title: "My App",
                    textAlignment: .center,
                    font: .system(size: 26, weight: .semibold),
                    colorAppBar: .white,
                    titleColor: .green
                )
                
                Spacer()
                
            }
   
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreItemsView()
}
