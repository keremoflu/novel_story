//
//  ReadNowButton.swift
//  NovelStory
//
//  Created by Kerem on 15.07.2025.
//

import SwiftUI

struct ReadNowButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack (spacing: 16) {
                Image(systemName: "book.fill")
                    .foregroundStyle(.white)
                    Text("Read Now")
                    .foregroundStyle(.white)
            }.padding()
                .background(.main)
                .clipShape(.capsule)
            
        }.buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.25), value: configuration.isPressed)
    }
}

#Preview {
    ReadNowButton(action: {})
}
