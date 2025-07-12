//
//  ChapterListSheet.swift
//  NovelStory
//
//  Created by Kerem on 3.07.2025.
//

import SwiftUI

struct ChapterListSheet: View {
    
    var chapterCount: Int
    
    var body: some View {
        VStack {
            List {
                ForEach(1...chapterCount, id: \.self) { index in
                    Text("Chapter \(index)")
                }
            }
        }
    }
}

#Preview {
    ChapterListSheet(chapterCount: 2)
}
