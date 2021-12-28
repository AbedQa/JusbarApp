//
//  ProductItemView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct ProductItemView: View {
    var product: Product
    var body: some View {
        HStack {
            HStack {
                Text(product.title)
                    .foregroundColor(.white)
                    .scaledFont(name: .regular, size: 17)
                Spacer()
                
                Text(product.price)
                    .foregroundColor(.white)
                    .scaledFont(name: .regular, size: 15)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity,maxHeight: 75)
            .background(
                LinearGradient(colors: product.colorList, startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(CustomShape(corner: .allCorners, size: 41))
            
            Image(product.image)
                .resizable()
                .frame(width: 75, height: 75)
        }
    }
}
