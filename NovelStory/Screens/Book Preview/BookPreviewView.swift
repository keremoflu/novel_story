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
        
        ZStack (alignment: .bottom){
            VStack (spacing: 0){
                BookDetailTopView()
                    .frame(width: .infinity, height: 230)
                
                VStack {
                    
                    //CHIP VIEW LIST
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0...5, id: \.self) { _ in
                                ChipView(title: ["Romance", "Pregnant", "CEO of Love"].randomElement() ?? "XXX")
                            }
                            
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.vertical, 4)
                    }
                    .padding(.top, 24)
                    
                    //EXPANDABLE SUMMARY
                    ExpandableView(title: "Summary", text: .constant("SummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummary"))
                    
                    Color.gray.opacity(0.1)
                        .frame(width: .infinity, height: 14)
                    
                    ExpandableView(title:"Chapter #1", text: .constant("Xxxxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zzzzxxxx-yyyyy-zzzzzXxxxxxx-yyyyy-zz"))
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
                .offset(y: -32)
                Spacer()
            }
            
            GeometryReader { geometry in
                Button {
                   
                } label: {
                    HStack(spacing: 16) {
                        Image(systemName: "book.fill")
                            .foregroundStyle(.white)
                        Text("Read Now")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                .frame(width: 300, height: 60)
                .background(.main)
                .clipShape(.capsule)
                .buttonStyle(ScaleButtonStyle())
                .position(x: geometry.size.width / 2, y: geometry.size.height - 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }
}

#Preview {
    BookPreviewView(bookPreviewViewModel: BookPreviewViewModel())
}
