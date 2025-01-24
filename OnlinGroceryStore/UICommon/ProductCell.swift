//
//  ProductCell.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 23/01/2025.
//

import SwiftUI

struct ProductCell: View {
    var didAddCart: ( ()->() )?
    
    var body: some View {

        VStack{
            Image("banana")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 80)
            Spacer()
            
            Text("ddccx")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundStyle(Color.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("kljnksd")
                .font(.customfont(.medium, fontSize: 16))
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            HStack{
                Text("$55.5")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundStyle(Color.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
                
                Button {
                    
                    didAddCart?()
                } label: {
                    Image("add1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background( Color.primaryApp)
                .cornerRadius(13)
                
                
            }
            
        }
        .padding(15)
        .frame(width: 200, height: 230)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
        )
        
    }
}

#Preview {
    ProductCell()
}
