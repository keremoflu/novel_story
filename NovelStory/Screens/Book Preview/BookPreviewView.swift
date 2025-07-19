//
//  BookPreviewView.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import SwiftUI

struct BookPreviewView: View {
    
    @StateObject var bookPreviewViewModel: BookPreviewViewModel
    
    @Namespace private var animationNameSpace
    @State private var isImageExpanded = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                BookDetailTopView(isImageTapped: {
                    withAnimation(.spring()) {
                        isImageExpanded.toggle()
                    }
                }, namespace: animationNameSpace,
                   image: .cover4)
                .frame(maxWidth: .infinity, maxHeight: 230)
                
                if !isImageExpanded {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0...5, id: \.self) { _ in
                                    ChipView(title: ["Romance", "Pregnant", "CEO of Love"].randomElement() ?? "XXX")
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        }
                        .padding(.top, 24)

                        ExpandableView(title: "Summary", text: .constant("dsdasdasdasdasd das dasdas das dad sad asd asdsaasdasdasd"))

                        Color.gray.opacity(0.1)
                            .frame(height: 14)

                        ExpandableView(title: "Chapter #1", text: .constant("dsadsadasdasdaxxaccczxczxczczxcaczxczdqdaczcx"))

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
                    .offset(y: -32)
                }
                
                Spacer()
            }
            .zIndex(0)
            
            VStack {
                Spacer()
                Button(action: {
                    print("Read Now tapped")
                }) {
                    HStack(spacing: 16) {
                        Image(systemName: "book.fill")
                            .foregroundStyle(.white)
                        Text("Read Now")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.main)
                    .clipShape(Capsule())
                }
                .buttonStyle(ScaleButtonStyle())
                .padding(.bottom, 16)
            }
            
            if isImageExpanded {
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isImageExpanded.toggle()
                        }
                    }
                    .zIndex(1)

                Image(.cover4)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "bookImage", in: animationNameSpace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.clear)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isImageExpanded.toggle()
                        }
                    }
                    .zIndex(2)
            }

        }
    }
}


#Preview {
    BookPreviewView(bookPreviewViewModel: BookPreviewViewModel())
}
