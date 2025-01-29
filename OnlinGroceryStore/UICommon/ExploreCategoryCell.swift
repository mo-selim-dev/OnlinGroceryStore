//
//  ExploreCategoryCell.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [ : ])
    
    var body: some View {
        VStack{
            WebImage(url: URL(string: cObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Spacer()
            
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding(15)
        .background( cObj.color.opacity(0.3) )
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(cObj.color, lineWidth: 1)
        }
    }
}

#Preview {
    ExploreCategoryCell(cObj: ExploreCategoryModel(dict: [ "cat_id": 2,
                                                           "cat_name": "Rice",
                                                           "image": "http://localhost:3001/img/type/202307311000160168a0737aEiC.png",
                                                           "color": "53B175"]) )
    .padding(20)
}
