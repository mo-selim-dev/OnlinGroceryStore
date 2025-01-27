//
//  ProductDetail.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 26/01/2025.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {

        ZStack{
                backButton(action: dismiss)

            
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView()
}
