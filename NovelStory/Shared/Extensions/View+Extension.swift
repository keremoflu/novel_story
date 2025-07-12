//
//  View+Extension.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 12.07.2025.
//

import Foundation
import SwiftUI

extension View {
    func responsiveContainer(horizontalPadding: CGFloat = 16, maxWidth: CGFloat = 700) -> some View {
        self
            .frame(maxWidth: UIDevice.current.userInterfaceIdiom == .pad ? maxWidth : .infinity, alignment: .leading)
            .padding(.horizontal, horizontalPadding)
    }
}
