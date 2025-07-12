//
//  BookPreviewView.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import SwiftUI

struct BookPreviewView: View {
    
    @StateObject var bookPreviewViewModel: BookPreviewViewModel
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack(spacing: 16) {
                    Image(.biology)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width * 0.3, height: 160)
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(.leading)
                    
                VStack (alignment: .leading, spacing: 8) {
                        Text("Crown on Light Crown on Book Name")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text("24 Chapters")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    
                        Spacer()
                    
                        Text("203.K Views")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                    }
                }.frame(height: 160)
            }.frame(maxWidth: .infinity, maxHeight: 160)
               
                
            .padding(.bottom, 32)
//            .background(.black.opacity(0.2))
            
            Spacer()
        }
    }
}

#Preview {
    BookPreviewView(bookPreviewViewModel: BookPreviewViewModel())
}
