//
//  ReaderViewModel.swift
//  NovelStory
//
//  Created by Kerem on 5.07.2025.
//

import Foundation
import SwiftUI

class ReaderViewModel: ObservableObject {
    
    @Published var chapterText =
        """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec lacus sed lorem gravida commodo. Vivamus eu eros quis mauris varius tincidunt. Phasellus sit amet erat ut erat sollicitudin gravida. Maecenas ultricies felis at urna hendrerit, ut varius erat consectetur. Duis cursus, elit eu dignissim gravida, purus orci faucibus lorem, at pretium libero erat vel magna. Nullam vel augue nec arcu cursus consequat. Vestibulum vitae tortor metus. Fusce placerat efficitur odio, ut luctus sem dapibus at. Nam vulputate, nulla et egestas dignissim, ipsum erat condimentum lorem, non egestas diam metus a nibh. Sed congue, tortor ac vehicula iaculis, enim sem fringilla lacus, nec luctus augue purus ut velit. Aliquam erat volutpat. Vestibulum laoreet nec sem nec laoreet.

Praesent luctus, mauris ac congue facilisis, ipsum dolor vehicula elit, vitae dignissim libero metus in metus. Integer luctus semper nisi, eu rhoncus leo fermentum nec. Suspendisse potenti. Cras sed ornare odio. Nullam luctus risus eu tortor placerat, quis feugiat augue faucibus. Proin tincidunt, orci et sodales facilisis, lorem odio dapibus sapien, non dapibus est urna ac metus. Curabitur porta elit eget metus dignissim, sed cursus sem dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam vel blandit purus.

Vivamus hendrerit convallis arcu, ut faucibus lacus congue at. Duis blandit dui ac mi luctus, et facilisis neque convallis. Sed ullamcorper odio a sapien sollicitudin, et euismod lorem posuere. Donec vitae leo eu lectus cursus malesuada. Morbi rhoncus vehicula diam nec dictum. Aliquam erat volutpat. Sed dapibus luctus justo, et euismod nulla viverra sed. Proin consequat efficitur sem, ut feugiat lorem scelerisque eu. Integer et cursus elit, id consequat turpis. Curabitur et sapien non justo efficitur hendrerit. Nullam vel justo quam.
"""

    
    @Published var pages: [String] = []
    @Published var currentPageIndex = 0
    
    func maxCharsPerScreen(font: UIFont = .systemFont(ofSize: 20),
                           menuHeight: CGFloat = 0,
                           navBarVisible: Bool = true) -> Int {

        let window = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }.first
        let safe = window?.safeAreaInsets ?? .zero

        var width  = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height

        width -= 32 + safe.left + safe.right

        
        height -= safe.top + safe.bottom               // notches / home bar
        height -= navBarVisible ? 44 : 0               // UINavigationBar
        height -= menuHeight                           // if you kept one

        let charWidth  = "abcdefghijklmnopqrstuvwxyz".size(withAttributes: [.font: font]).width / 26
        let lineHeight = font.lineHeight + 3.0

        return Int(floor(width / charWidth) * floor(height / lineHeight))
    }

    
    func separatePages() {
        let maxCharPerScreen = maxCharsPerScreen()
        print("maxCharPerScreen: \(maxCharPerScreen)")
        var startIndex = chapterText.startIndex
        var endIndex: String.Index
        
        while startIndex < chapterText.endIndex {
            
            endIndex = chapterText.index(startIndex, offsetBy: maxCharPerScreen, limitedBy: chapterText.endIndex) ?? chapterText.endIndex
            let page = String(chapterText[startIndex..<endIndex])
            pages.append(page)
            
            startIndex = endIndex
        }
        
        print("PAGES-----------")
        for item in pages {
            print(item)
            print("Count: \(item.count)")
            print("------- **** --------")
        }
    }
    
    func goPreviousPage() -> String {
        guard currentPageIndex > 0 else {
            print("Out of bound for GoNextPage")
            return pages[0]
        }
        currentPageIndex -= 1
        print("Previous Page: Current Index is : \(currentPageIndex)")
        return pages[currentPageIndex]
    }
    
    func goNextPage() -> String {
        
        guard currentPageIndex + 1 < pages.count else {
            print("Out of bound for GoNextPage")
            return pages[currentPageIndex]
        }
        
       //check is there any next available chapter
        
        
        currentPageIndex += 1
        print("Next Page: Current Index is : \(currentPageIndex)")
        return pages[currentPageIndex]
    }
}
