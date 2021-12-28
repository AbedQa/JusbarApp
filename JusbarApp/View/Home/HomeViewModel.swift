//
//  HomeViewModel.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

enum ProductViewType {
    case list
    case grid
}
class HomeViewModel: ObservableObject {
    private(set) var categoryList: [String] = [
        "smoothies", "pastry", "icemix", "mix"
    ]
    
    @Published var categorySelectedItem: String = "smoothies"
    
    private var productSmoothiesList: [Product] = [
        .init(title: "watermelon", price: "$ 50.00",image: "sp1", colorList: [Color(hex: .frenchRoseColor),Color(hex: .lavenderMagentaColor)]),
        .init(title: "mango", price: "$ 50.00",image: "sp2", colorList: [Color(hex: .monaLisaColor),Color(hex: .macaroniAndCheeseColor)]),
        .init(title: "blueburry", price: "$ 50.00",image: "sp3", colorList: [Color(hex: .mediumPurpleColor),Color(hex: .sailColor)]),
        .init(title: "avocado", price: "$ 50.00",image: "sp4", colorList: [Color(hex: .emeraldColor),Color(hex: .caperColor)]),
        .init(title: "grape", price: "$ 50.00",image: "sp5", colorList: [Color(hex: .lavenderColor),Color(hex: .azaleaColor)]),
        .init(title: "apple", price: "$ 70.00",image: "sp6", colorList: [Color(hex: .frolyColor),Color(hex: .lavenderPinkColor)]),
    ]
    
    private var productPastryList: [Product] = [
        .init(title: "watermelon", price: "$ 50.00",image: "sp7", colorList: [Color(hex: .frenchRoseColor),Color(hex: .lavenderMagentaColor)]),
        .init(title: "mango", price: "$ 50.00",image: "sp8", colorList: [Color(hex: .monaLisaColor),Color(hex: .macaroniAndCheeseColor)]),
        .init(title: "blueburry", price: "$ 50.00",image: "sp9", colorList: [Color(hex: .mediumPurpleColor),Color(hex: .sailColor)]),
        .init(title: "avocado", price: "$ 50.00",image: "sp10", colorList: [Color(hex: .emeraldColor),Color(hex: .caperColor)]),
        .init(title: "grape", price: "$ 50.00",image: "sp11", colorList: [Color(hex: .lavenderColor),Color(hex: .azaleaColor)]),
    ]
    
    private(set) var productList: [Product] = []
    
    @Published private(set) var isProductViewShow: Bool = false

    @Published private(set) var productViewType: ProductViewType = .grid
    
    init() {
    }
    
    func changeProductViewStatus(to status: Bool) {
        isProductViewShow = status
    }
    
    func changeProductList() {
        productList = categorySelectedItem == "smoothies" ? productSmoothiesList : productPastryList
    }
    
    func changeProductViewStatus(to type: ProductViewType) {
        productViewType = type
    }
}
