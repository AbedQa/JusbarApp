//
//  ColorManager.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension String {
    static var periwinkleColor = "#CED9FF"
    static var bilobaFlowerColor = "#AB87EB"
    static var malibuColor = "#99B0FB"
    static var galleryColor = "#F0F0F0"
    static var javaColor = "#1ABEC6"
    static var vikingColor = "#49D3DD"
    static var periwinkleLightColor = "#49D3DD"
    static var grayColor = "#939393"
    static var mediumPurpleColor = "#A076E8"
    static var sailColor = "#B1C4F8"
    static var illusionColor = "#F4AAD0"
    static var yellowOrangeColor = "#FFB13B"
    static var silverChaliceColor = "#A5A5A5"
    static var alabasterColor = "#F7F7F7"
    static var mischkaColor = "#D3D8E0"
    static var pigeonPostColor = "#A7BBDB"
    static var blueLightColor = "#F4F8FB"
    static var doveGrayColor = "#676767"
    static var persianPinkColor = "#EF7CBE"
    static var frenchRoseColor = "#F45D7E"
    static var lavenderMagentaColor = "#EC90E9"
    static var monaLisaColor = "#FD9B8D"
    static var macaroniAndCheeseColor = "#FBBE7E"
    static var emeraldColor = "#5CCD92"
    static var caperColor = "#BFE89C"
    static var lavenderColor = "#A86FDA"
    static var lavenderPinkColor = "#FBA6C6"
    static var azaleaColor = "#F5B9D5"
    static var frolyColor = "#F4787C"
}
