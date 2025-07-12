//
//  TestVC.swift
//  NovelStory
//
//  Created by Kerem on 28.06.2025.
//

import SwiftUI

struct TestVC: View {
    
    @StateObject var viewModel: ReaderViewModel
    @State var text = "Lorem ipsum"
    
    var body: some View {
        NavigationView {
            NavigationLink (destination: ReaderView(readerViewModel: ReaderViewModel())) {
                Text("Hello, World!")
                
                TextEditor(text: $text)
            }
        }
    }
}

#Preview {
    TestVC(viewModel: ReaderViewModel())
}
