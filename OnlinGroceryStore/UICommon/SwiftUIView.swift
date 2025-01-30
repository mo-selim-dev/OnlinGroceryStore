//
//  SwiftUIView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 29/01/2025.
//

import SwiftUI

struct SwiftUIView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            appBar2( iconName: "back") {
                dismiss()
            }
        }
           }
}

#Preview {
    SwiftUIView()
}


func appBar2(
    titel: String? = "",
    iconName: String = "back",
    iconSize: CGSize = CGSize(width: 25, height: 25),
    action: ( ()->() )
) -> some View {
    VStack {
        HStack {
            Button {

            } label: {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize.width, height: iconSize.height)
            }
            Spacer()
        }
        Spacer()
    }
    .padding(.top, .topInsets)
    .padding(.horizontal, 20)
}
