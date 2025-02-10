////
////  PromoCodeView.swift
////  OnlinGroceryStore
////
////  Created by Mohamed Selim on 06/02/2025.
////
//
//
//import SwiftUI
//
//struct PromoCodeView: View {
//    @Environment(\.dismiss) var dismiss
//    @StateObject var promoVM = PromoCodeViewModel.shared
//    @State var isPicker: Bool = false
//    var didSelect:( (_ obj: PromoCodeModel) -> () )?
//    
//    // MARK: - Body
//    
//    var body: some View {
//        ZStack{
//            
//            ScrollView{
//                LazyVStack(spacing: 15) {
//                    ForEach( promoVM.listArr , id: \.id ) {
//                        pObj in
//                        PromoCodeRowView(pObj: pObj, isPicker: isPicker, dismiss: dismiss, didSelect: didSelect)
//                    }
//                }
//                .padding(20)
//                .padding(.top, .topInsets + 46)
//                .padding(.bottom, .bottomInsets + 60)
//                
//            }
//            
//            VStack{
//                headerView
//                Spacer()
//                
//            }
//        }
//        .navigationBarHidden(true)
//        .ignoresSafeArea()
//        .onAppear{
//            
//        }
//        
//    }
//    
//    
//    // MARK: - Bar
//    
//    private var headerView: some View {
//        
//        HStack{
//            Button {
//                dismiss()
//            } label: {
//                Image("back")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//            }
//            
//            Spacer()
//            
//            Text("Promo Code")
//                .font(.customfont(.bold, fontSize: 20))
//                .frame(height: 46)
//            Spacer()
//            
//        }
//        .padding(.top, .topInsets)
//        .padding(.horizontal, 20)
//        .background(Color.white)
//        .shadow(color: Color.black.opacity(0.2),  radius: 2 )
//    }
//} // End PromoCode
//
//
//// MARK: - Promo Code Row
//
//struct PromoCodeRowView: View {
//    let pObj: PromoCodeModel
//    let isPicker: Bool
//    let dismiss: DismissAction
//    var didSelect:( (_ obj: PromoCodeModel) -> () )? // do its a true ?!
//
//    
//    
//    var body: some View {
//        
//        VStack{
//            HStack {
//                Text(pObj.title)
//                    .font(.customfont(.bold, fontSize: 14))
//                    .foregroundColor(.primaryText)
//                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                
//                
//                Text(pObj.code)
//                    .font(.customfont(.bold, fontSize: 15))
//                    .foregroundColor(.primaryApp)
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 2)
//                    .background(Color.secondaryText.opacity(0.3))
//                    .cornerRadius(5)
//            }
//            
//            Text(pObj.description)
//                .font(.customfont(.medium, fontSize: 14))
//                .foregroundColor(.secondaryText)
//                .multilineTextAlignment( .leading)
//                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//            
//            HStack{
//                Text("Expiry Date:")
//                    .font(.customfont(.bold, fontSize: 14))
//                    .foregroundColor(.primaryText)
//                    .padding(.vertical, 8)
//                
//                
//                Text( pObj.endDate.displayDate(format: "yyyy-MM-dd hh:mm a") )
//                    .font(.customfont(.bold, fontSize: 12))
//                    .foregroundColor(.secondaryText)
//                    .padding(.vertical, 8)
//                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//            }
//        }
//        .padding(15)
//        .background(Color.white)
//        .cornerRadius(5)
//        .shadow(color: Color.black.opacity(0.15), radius: 2)
//        .onTapGesture {
//            if(isPicker) {
//                dismiss()
//                didSelect?(pObj) }
//        }
//        
//    }
//}
//
//
//#Preview {
//    PromoCodeView()
//}


import SwiftUI

struct PromoCodeView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var promoVM = PromoCodeViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PromoCodeModel) -> () )?
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach( promoVM.listArr , id: \.id, content: {
                        pObj in
                        
                            VStack{
                                HStack {
                                    Text(pObj.title)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Text(pObj.code)
                                        .font(.customfont(.bold, fontSize: 15))
                                        .foregroundColor(.primaryApp)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.secondaryText.opacity(0.3))
                                        .cornerRadius(5)
                                }
                                
                                Text(pObj.description)
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.secondaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Text("Expiry Date:")
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .padding(.vertical, 8)
                                        
                                    
                                    Text( pObj.endDate.displayDate(format: "yyyy-MM-dd hh:mm a") )
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.secondaryText)
                                        .padding(.vertical, 8)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .padding(15)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.15), radius: 2)
                        
                            .onTapGesture {
                                if(isPicker) {
                                    dismiss()
                                    didSelect?(pObj)
                                }
                            }

                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)

            }
            
            
            VStack {
                    
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text("Promo Code")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                   

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
            
            
        }
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct PromoCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PromoCodeView()
    }
}

