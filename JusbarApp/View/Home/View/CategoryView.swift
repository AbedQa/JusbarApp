//
//  CategoryView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct CategoryView: View {
    var name: String
    @Binding var categorySelectedItem: String
    var namespace: Namespace.ID
    var onItemChange: (() -> ())
    var body: some View {
        VStack(spacing: 4) {
            Text(name)
                .scaledFont(name: .regular, size: 15)
                .foregroundColor(Color(hex: .doveGrayColor))
            if categorySelectedItem == name {
                Circle()
                    .fill()
                    .frame(width: 7, height: 7)
                    .foregroundColor(Color(hex: .persianPinkColor))
                    .matchedGeometryEffect(id: "circle", in: namespace)
            }
        }.onTapGesture {
            withAnimation {
                categorySelectedItem = name
            }
            onItemChange()
        }
    }
}
