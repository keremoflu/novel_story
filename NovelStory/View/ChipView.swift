//
//  ChipView.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import SwiftUI

struct ChipView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 16))
            .fontWeight(.regular)
            .foregroundStyle(.main)
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(.main.opacity(0.1))
            .clipShape(.capsule)
            .overlay {
                Capsule()
                    .stroke(Color.main, lineWidth: 1.0)
            }
    }
}

#Preview {
    ChipView(title: "Romance")
}
