//
//  DelieryAddressView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 05/02/2025.
//


import SwiftUI

struct DelieryAddressView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: AddressModel) -> () )?
    
    var body: some View {
        Text("Hello!")
    }
}

#Preview {
    NavigationView {
        DelieryAddressView()
    }
}
