//
//  RoundButton.swift
//  App1
//
//  Created by Mohamed Selim on 10/31/24.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
        //                .background( Color.primaryApp)
        .background( Color(hex: "31511E").opacity(0.9))
        .cornerRadius(20)
    }
}


#Preview {
    RoundButton()
        .padding(20)
}
