//
//  HomeView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI
import ACarousel

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @Namespace var namespace
    @State var isDisplay = true
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 66) {
                    ForEach(homeViewModel.categoryList,id:\.self) { item in
                        CategoryView(name: item, categorySelectedItem: $homeViewModel.categorySelectedItem, namespace: namespace) {
                            homeViewModel.changeProductViewStatus(to: false)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.5)) {
                                    homeViewModel.changeProductViewStatus(to: true)
                                    homeViewModel.changeProductList()
                                }
                            }
                        }
                    }
                }
            }
            
            HStack(spacing: 50) {
                Image(systemName: "list.dash")
                    .foregroundColor(homeViewModel.productViewType == .list ? Color(hex: .frenchRoseColor) : Color(hex: .grayColor))
                    .font(.title2)
                    .onTapGesture {
                        homeViewModel.changeProductViewStatus(to: .list)
                    }
                Image(systemName: "rectangle.grid.2x2")
                    .foregroundColor(homeViewModel.productViewType == .grid ? Color(hex: .frenchRoseColor) : Color(hex: .grayColor))
                    .font(.title2)
                    .onTapGesture {
                        homeViewModel.changeProductViewStatus(to: .grid)
                    }
            }
            .padding(.vertical)
            
            if homeViewModel.isProductViewShow {
                if homeViewModel.productViewType == .grid {
                    ACarousel(homeViewModel.productList,
                              spacing: 20,
                              headspace: 10,
                              sidesScaling: 0.7,
                              isWrap: true,
                              autoScroll: .active(5)) { item in
                        CategoryGridView(product: item)
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(homeViewModel.productList ,id:\.id) { product in
                                ProductItemView(product: product)
                            }
                        }
                    }
                     .transition(.slide)
                }
               
            }
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
            Color(hex: .blueLightColor)
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.5)) {
                homeViewModel.changeProductViewStatus(to: true)
                homeViewModel.changeProductList()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

