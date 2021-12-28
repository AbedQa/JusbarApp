//
//  CategoryGridView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct CategoryGridView: View {
    var product: Product
    @State var cartItemCount = 1
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image(product.image)
                    .resizable()
                    .frame(width: 125, height: 125)
                Text(product.title)
                    .scaledFont(name: .medium, size: 27)
                    .foregroundColor(.white)
                Text(product.price)
                    .scaledFont(name: .regular, size: 20)
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(height: 1)
                    .padding(.top)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.white)
                        .font(.title2)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                cartItemCount = cartItemCount <= 1 ? 1 : cartItemCount - 1
                            }
                        }
                    
                    Text("\(cartItemCount)")
                        .scaledFont(name: .bold, size: 20)
                        .foregroundColor(.white)
                    
                    Image(systemName: "plus.circle")
                        .foregroundColor(.white)
                        .font(.title2)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                cartItemCount = cartItemCount + 1
                            }
                        }
                }.padding(.top, 12)
                
                Spacer()
            }
            .padding(.vertical,50)
            .frame(maxWidth: .infinity, maxHeight: 366.75,alignment: .center)
            .background(
                LinearGradient(colors: product.colorList, startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(30)
            )
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView(product:.init(title: "watermelon", price: "$ 50.00",image: "sp1", colorList: [Color(hex: .frenchRoseColor),Color(hex: .lavenderMagentaColor)]))
    }
}
