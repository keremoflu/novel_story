//
//  BookDetailTopView.swift
//  NovelStory
//
//  Created by Kerem on 12.07.2025.
//

import SwiftUI

struct BookDetailTopView: View {
    
    var isImageTapped: () -> Void
    var namespace: Namespace.ID
    var image: ImageResource
    
    var body: some View {
        
        VStack {
            GeometryReader { proxy in
                HStack(spacing: 16) {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width * 0.3, height: proxy.size.height)
                        .clipShape(.rect(cornerRadius: 8))
                        .matchedGeometryEffect(id: "bookImage", in: namespace)
                        .padding(.leading)
                        .onTapGesture {
                            isImageTapped()
                        }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Crown on Light Crown on Book Name")
                            .font(.montserrat(size: 20, weight: .semiBold))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                        
                        Text("24 Chapters")
                            .font(.montserrat(size: 16, weight: .regular))
                            .foregroundStyle(.white)

                        Spacer()
                        
                        Text("203.K Views")
                            .font(.montserrat(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                    .frame(height: 160)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 160)
            .padding(.bottom, 64)
            .background(
                ZStack {
                    Image(image)  // use same image for background blur
                        .resizable()
                        .overlay(.ultraThinMaterial)
                    
                    Color.black.opacity(0.4)
                }.ignoresSafeArea()
            )
            
            Spacer()
        }
    }
}


#Preview {
    BookDetailTopView(isImageTapped: {}, namespace: Namespace().wrappedValue, image: .exampleBook1)
}
