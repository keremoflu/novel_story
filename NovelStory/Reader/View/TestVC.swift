//
//  TestVC.swift
//  NovelStory
//
//  Created by Kerem on 28.06.2025.
//

import SwiftUI

struct TestVC: View {
    var body: some View {
        NavigationView {
            NavigationLink (destination: ReaderView()) {
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    TestVC()
}
