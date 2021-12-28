//
//  Product.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct Product: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
    var colorList: [Color]
}
