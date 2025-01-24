//
//  CategoryCell.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 24/01/2025.
//

import SwiftUI

struct CategoryCell: View {
    @State var color: Color = Color.yellow
    var didAdCart: ( ()->() )?
    var body: some View {
        HStack {
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            Spacer()
            
            Text("pulses")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(color.opacity(0.3))
        .cornerRadius(16)



    }
}

#Preview {
    CategoryCell()
}
