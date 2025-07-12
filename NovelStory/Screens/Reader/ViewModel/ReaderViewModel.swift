//
//  ReaderViewModel.swift
//  NovelStory
//
//  Created by Kerem on 5.07.2025.
//

import Foundation
import UIKit

class ReaderViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var pages: [String] = []
    
    // Sample chapters (You will use the provided chapters text here)
    @Published var chapters = [
        """
        Chapter 1 Chapter 1Chapter 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        ---Praesxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxque eu.
        """,
        
        """
        Chapter 2Chapter 2Chapter 2Chapter 2 --- yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy et egestas dignissim, ipsum erat condimentum lorem, non egestas diam metus a nibh. Sed congue, tortor ac vehicula iaculis, enim sem fringilla lacus, nec luctus augue purus ut velit.
        Praesent luctus, mauris ac congue facilisis, ipsum dolor vehicula elit, vitae dignissim libero metus in metus. Integer luctus semper nisi, eu rhoncus leo fermentum nec. Suspendisse potenti. Cras sed ornare odio. Nullam luctus risus eu tortor placerat, quis feugiat augue faucibus.
        """,
        
        """
        Chapter 3 Chapter 3Chapter 3Chapter 3--- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec lacus sed lorem gravida commodo. Vivamus eu eros quis mauris varius tincidunt. Phasellus sit amet erat ut erat sollicitudin gravida. Maecenas ultricies felis at urna hendrerit, ut varius erat consectetur. Duis cursus, elit eu dignissim gravida, purus orci faucibus lorem, at pretium libero erat vel magna.
        """
    ]
    
    // Pagination parameters
    var pageCharacterLimit: Int = 0
    
    // State for chapter and page
    private(set) var currentChapterIndex: Int = 0
    private(set) var currentPageIndex: Int = 0
    
    private var chapterPageCache: [Int: [String]] = [:]
    
    // MARK: - Initialization
    func initialize(startingChapter: Int = 0, fontSize: CGFloat = 20.0, menuHeight: CGFloat = 0, navBarVisible: Bool = true) {

        self.pageCharacterLimit = maxCharsPerScreen(font: UIFont.systemFont(ofSize: fontSize), menuHeight: menuHeight, navBarVisible: navBarVisible)
        
        currentChapterIndex = startingChapter
        loadPages(for: currentChapterIndex)
    }
    
    // MARK: - Pagination Logic
    private func paginate(_ text: String, limit: Int) -> [String] {
        var pages: [String] = []
        var start = text.startIndex
        
        while start < text.endIndex {
            let end = text.index(start, offsetBy: limit, limitedBy: text.endIndex) ?? text.endIndex
            let slice = String(text[start..<end])
            pages.append(slice)
            start = end
        }
        
        return pages
    }
    
    private func loadPages(for chapterIndex: Int) {
        if let cached = chapterPageCache[chapterIndex] {
            pages = cached
        } else {
            let chapterText = chapters[chapterIndex]
            let newPages = paginate(chapterText, limit: pageCharacterLimit)
            chapterPageCache[chapterIndex] = newPages
            pages = newPages
        }
        currentPageIndex = 0
    }
    
    // MARK: - Page Navigation
    func goNextPage() -> String {
        if currentPageIndex + 1 < pages.count {
            currentPageIndex += 1
        } else if currentChapterIndex + 1 < chapters.count {
            currentChapterIndex += 1
            loadPages(for: currentChapterIndex)
        }
        return pages[currentPageIndex]
    }
    
    func goPreviousPage() -> String {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
        } else if currentChapterIndex > 0 {
            currentChapterIndex -= 1
            loadPages(for: currentChapterIndex)
            currentPageIndex = pages.count - 1
        }
        return pages[currentPageIndex]
    }
    
    // MARK: - Max Chars Per Screen Calculation
    func maxCharsPerScreen(font: UIFont = .systemFont(ofSize: 20),
                           menuHeight: CGFloat = 0,
                           navBarVisible: Bool = true) -> Int {

        let window = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }.first
        let safe = window?.safeAreaInsets ?? .zero

        var width  = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height

        width -= 32 + safe.left + safe.right
        height -= safe.top + safe.bottom        // notches / home bar
        height -= navBarVisible ? 44 : 0        // UINavigationBar
        height -= menuHeight                    // if you kept one

        let charWidth  = "abcdefghijklmnopqrstuvwxyz".size(withAttributes: [.font: font]).width / 26
        let lineHeight = font.lineHeight + 3.0

        return Int(floor(width / charWidth) * floor(height / lineHeight))
    }
}
