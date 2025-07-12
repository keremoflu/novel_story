//
//  Font+Extension.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 5.07.2025.
//

import Foundation
import SwiftUI

extension Font {
    
    enum FontWeight: String {
        case thin = "Montserrat-Thin"
        case light = "Montserrat-Light"
        case regular = "Montserrat-Regular"
        case medium = "Montserrat-Medium"
        case semiBold = "Montserrat-SemiBold"
        case bold = "Montserrat-Bold"
        case extraBold = "Montserrat-ExtraBold"
    }
    
    static func montserrat(size: CGFloat, weight: FontWeight) -> Font {
        let multiplier: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.6 : 1.0
        return Font.custom(weight.rawValue, size: size * multiplier)
    }
}
