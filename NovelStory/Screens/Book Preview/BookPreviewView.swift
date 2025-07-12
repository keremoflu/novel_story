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
                ExpandableView(text: .constant("SummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummarySummary"))
                
                Color.gray.opacity(0.1)
                    .frame(width: .infinity, height: 14)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(.white)
            .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
            .offset(y: -32)
            Spacer()
        }
    }
}

#Preview {
    BookPreviewView(bookPreviewViewModel: BookPreviewViewModel())
}
