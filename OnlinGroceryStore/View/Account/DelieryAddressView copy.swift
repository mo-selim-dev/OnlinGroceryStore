//
//  DelieryAddressView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 05/02/2025.
//

import SwiftUI

struct DelieryAddressView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    var didSelect:( (_ obj: DeliveryAddressModel) -> () )?
    @State var isPicker: Bool = false
    

    // MARK: - Body

    var body: some View {
        ZStack {
            ScrollView {
               addressList
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
            VStack {
                headerView
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        .onAppear{

        }
        
    }
    
    // MARK: - Address List

    var addressList: some View {
            LazyVStack(spacing: 15) {
            ForEach(addressVM.listArr, id: \.id) { aObj in
                DeliveryAddressRowView(
                    aObj: aObj,
                    isPicker: isPicker,
                    dismiss: dismiss,
                    addressVM: addressVM,
                    didSelect: didSelect)
            }
        }
    }
    
    // MARK: - Header

    private var headerView: some View {
        HStack {
            Button { dismiss() } label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            Spacer()
            Text("Delivery Address")
                .font(.customfont(.bold, fontSize: 20))
                .frame(height: 46)
            Spacer()
            NavigationLink {
                 AddDeliveryAddressView()
            } label: {
                Image("add_temp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .foregroundColor(.primaryText)
            .padding(.bottom, 8)
        }
        .padding(.top, .topInsets)
        .padding(.horizontal, 20)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 2)
    }
}


// MARK: - Delivery Address Row

struct DeliveryAddressRowView: View {
    let aObj: DeliveryAddressModel
    let isPicker: Bool
    let dismiss: DismissAction
    let addressVM: DeliveryAddressViewModel
    var didSelect:( (_ obj: DeliveryAddressModel) -> () )?

    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(aObj.name)
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(aObj.typeName)
                        .font(.customfont(.bold, fontSize: 12))
                        .foregroundColor(.primaryText)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.secondaryText.opacity(0.3))
                        .cornerRadius(5)
                }
                Text("\(aObj.address), \(aObj.city), \(aObj.state), \(aObj.postalCode)")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(.primaryText)
                    .multilineTextAlignment(.leading)
                Text(aObj.phone)
                    .font(.customfont(.bold, fontSize: 12))
                    .foregroundColor(.secondaryText)
                    .padding(.vertical, 8)
            }
            VStack {
                Spacer()
                NavigationLink {
                    AddDeliveryAddressView(isEdit: true, editObj: aObj)
                } label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryApp)
                }
                .padding(.bottom, 8)
                Button {
                    addressVM.serviceCallRemove(cObj: aObj)
                } label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.15), radius: 2)
        .onTapGesture {
            if isPicker {
                dismiss()
                didSelect?(aObj)

            }
        }
    }
}

#Preview {
    NavigationView {
        DelieryAddressView()
    }
}

