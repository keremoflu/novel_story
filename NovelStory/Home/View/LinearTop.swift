//
//  LinearTop.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 5.07.2025.
//

import Foundation
import SwiftUI

struct LinearTop: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                .themePrimary.opacity(0.3),
                .themePrimary.opacity(0.1),
                .white.opacity(0.0)
            ]),
            startPoint: .top,
            endPoint: .init(x: 0.5, y: 0.2)
        )
        .ignoresSafeArea()
    }
}
