//
//  BookDetailTopView.swift
//  NovelStory
//
//  Created by Kerem on 12.07.2025.
//

import SwiftUI

struct BookDetailTopView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack(spacing: 16) {
                    Image(.cover4)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width * 0.3, height: proxy.size.height)
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(.leading)
                    
                VStack (alignment: .leading, spacing: 8) {
                        Text("Crown on Light Crown on Book Name")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.white)
                        
                        Text("24 Chapters")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundStyle(.white)

                    Spacer()
                        Text("203.K Views")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                    
                }.frame(width: .infinity, height: 160)
               
                }
            }.frame(maxWidth: .infinity, maxHeight: 160)
            .padding(.bottom, 64)
            .background(
                ZStack {
                    Image(.cover4)
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
    BookDetailTopView()
}
