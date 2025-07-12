//
//  BookPreviewViewModel.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import Foundation

class BookPreviewViewModel: ObservableObject {
    @Published var summaryText = "Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 Lorem ipsum 1 "
    
    enum BookTag: String {
        case romance = "Romance"
        case ceolove = "CEO of Love"
        case pregnant = "Pregnant"
    }
}
