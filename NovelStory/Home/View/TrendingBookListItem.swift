//
//  TrendingBookListItem.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 5.07.2025.
//

import SwiftUI

struct TrendingBookListItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            GeometryReader { geo in
                Image(.exampleBook1)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.width * 1.5)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .clipped()
            }
            .aspectRatio(2/3, contentMode: .fit)

            Text("Book Of This an That With off and That")
                .font(.montserrat(size: 12, weight: .medium))
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.leading)
        }
    }
}


