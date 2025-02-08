//
//  MyCartView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 04/02/2025.
//


import SwiftUI

struct MyCartView: View {
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
            
            if(cartVM.listArr.count == 0) {
                Text("You Card is Empty")
                    .font(.customfont(.bold, fontSize: 20))
            }
            
            ScrollView{
                LazyVStack {
                    ForEach( cartVM.listArr , id: \.id, content: {
                        cObj in
                        
                        CartItemRow(cObj: cObj)
                        
                    })
                    .padding(.vertical, 8)
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
                
            }
            
            
            VStack {
                
                HStack{
                    
                    Spacer()
                    
                    Text("My Cart")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
                if(cartVM.listArr.count > 0) {
                    Button {
                        cartVM.showCheckout = true
                    } label: {
                        ZStack {
                            Text("Check Out")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            HStack {
                                Spacer()
                                Text("$\(cartVM.total)")
                                    .font(.customfont(.semibold, fontSize: 12))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.darkGray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                            .padding(.trailing)
                        }
                        
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 80)
                }
            }
            .onAppear{ cartVM.serviceCallList() }
            
//            .sheet(isPresented: $cartVM.showCheckout) {
//                CheckoutView()
//                    .presentationDetents([.height(.screenWidth * 1.3), .medium])
//            }

            if (cartVM.showCheckout){
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            cartVM.showCheckout = false
                        }
                    }
                CheckoutView(isShow: $cartVM.showCheckout)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
        } // end top ZStack
        .alert(isPresented: $cartVM.showError, content: {
            Alert(title: Text(Globs.appName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .animation(.easeInOut, value: cartVM.showCheckout)
        .ignoresSafeArea()
    }
}
#Preview {
    NavigationView {
        MyCartView()
    }
}

