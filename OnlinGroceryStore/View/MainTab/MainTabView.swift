//
//  MainTabView.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 23/01/2025.
//

import SwiftUI
import Combine

struct MainTabView: View {
    
    @ObservedObject var mainTabVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $mainTabVM.selectTab) {
                    HomeView().tag(0)
                    ExploreView().tag(1)
                    ExploreView().tag(2)
                    ExploreView().tag(3)
                    ExploreView().tag(4)
                }
                //                .onAppear{
                //                     UIScrollView.appearance().isScrollEnabled = false
                //                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: mainTabVM.selectTab) { newValue in
                    debugPrint("Sel Tab: \(newValue)")
                }
                
                HStack {
                    TabButton(title: "Shop", icon: "store_tab", isSelect: mainTabVM.selectTab == 0) {
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                mainTabVM.selectTab = 0
                            }
                        }
                        
                    }
                    
                    TabButton(title: "Explore", icon: "explore_tab", isSelect: mainTabVM.selectTab == 1) {
                        DispatchQueue.main.async {
                            withAnimation {
                                mainTabVM.selectTab = 1
                            }
                        }                    }
                    
                    TabButton(title: "Cart", icon: "cart_tab", isSelect: mainTabVM.selectTab == 2) {
                        DispatchQueue.main.async {
                            withAnimation {
                                mainTabVM.selectTab = 2
                            }
                        }                    }
                    
                    TabButton(title: "Favourite", icon: "fav_tab", isSelect: mainTabVM.selectTab == 3) {
                        DispatchQueue.main.async {
                            withAnimation {
                                mainTabVM.selectTab = 3
                            }
                        }
                    }
                    
                    TabButton(title: "Account", icon: "account_tab", isSelect: mainTabVM.selectTab == 4) {
                        DispatchQueue.main.async {
                            withAnimation {
                                mainTabVM.selectTab = 4
                            }
                        }
                    }
                    
                    
                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .padding(.horizontal, 10)
                .background(.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: -2)
                
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        
        
    }
}

#Preview {
    MainTabView()
}
