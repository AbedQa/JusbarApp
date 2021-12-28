//
//  FontManager.swift
//  AirtelApp
//
//  Created by AbdelrahmanQasim on 12/26/21.
//

import SwiftUI

private var fontParentName = "Roboto"

enum FontType: String {
    case black
    case blackItalic
    case bold
    case boldItalic
    case italic
    case light
    case lightItalic
    case medium
    case mediumItalic
    case regular
    case thin
    case thinItalic
}
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom("\(fontParentName)-\(name)", size: scaledSize))
    }
}

extension View {
    func scaledFont(name: FontType, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name.rawValue.capitalized, size: size))
    }
}
