//
//  EditorsPickBookListItem.swift
//  NovelStory
//
//  Created by Batuhan Tibet Ayaydin on 12.07.2025.
//

import SwiftUI
import Flow

struct EditorsPickBookListItem: View {
    private let tags: [String] = ["This", "That", "Thoose", "Whaat", "OOF"]
    var body: some View {
        HStack(spacing: 6) {
            GeometryReader { geo in
                Image(.exampleBook1)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.width * 1.5)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .clipped()
            }
            .aspectRatio(2/3, contentMode: .fit)
            VStack {
                Text("Book of That and This")
                    .font(.montserrat(size: 10, weight: .semiBold))
                    .lineLimit(3, reservesSpace: false)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)
                HFlow(horizontalAlignment: .leading, verticalAlignment: .top, horizontalSpacing: 4, verticalSpacing: 4) {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.montserrat(size: 8, weight: .medium))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.themeGray2)
                            .foregroundStyle(.black.opacity(0.7))
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            Spacer()
        }
    }
}
