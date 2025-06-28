//
//  ContentView.swift
//  NovelStory
//
//  Created by Kerem on 27.06.2025.
//

import SwiftUI

struct ReaderView: View {
    
    @State var isHiddenMode: Bool = false
    
    private let sampleText = """
    Bölüm 1

    Brook ön kapıdan sessizce dışarı çıktı ve evin yan tarafına doğru süründü.

    Annesi bu gece Tom ile odadaydı. Tom'un elleri onun memesini okşarken tutkulu bir şekilde öpüşüyorlardı.

    "Ahhhh." diye inledi annesi, Tom dudaklarını aşağıya doğru hareket ettirirken.

    "Şşşş, bağırma, Brook'u uyandırabilirsin." dedi Tom, onun klitoris­ini yalarken. Bu hareket, Janice'in vücudunda bir duygu patlaması yarattı.

    Tom'un usta dili klitorisini yukarı aşağı hareket ettiriyordu…
    """
    
    
    var body: some View {
        ZStack {
            ScrollView {
                Text(sampleText)
            }.padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isHiddenMode.toggle()
                    }
                }
            
            
            VStack {
                Spacer()
                if !isHiddenMode {
                    BottomView(action: { item in
                        print("action! \(item)")
                    })
                        .transition(
                            .move(edge: .bottom)
                            .combined(with: .opacity)
                        )
                }
                    
            }.ignoresSafeArea()
                
        }
        .navigationTitle("Book Name")
        .toolbarTitleDisplayMode(.inline)
        .statusBarHidden(isHiddenMode)
        .toolbar(isHiddenMode ? .hidden : .visible, for: .navigationBar)
    }
}

private struct BottomView: View {
    
    enum BottomMenu {
        case chapter, mode, size, exit
    }
    
    var action: (BottomMenu) -> Void
    
    var body: some View {
        HStack (spacing: 32) {
            bottomItem(imageName: "list.dash", labelText: "Chapter", action: {
                action(.chapter)
            })
            
            bottomItem(imageName: "moon", labelText: "Mode", action: {
                action(.mode)
            })
            
            bottomItem(imageName: "textformat", labelText: "Size", action: {
                action(.size)
            })
            bottomItem(imageName: "xmark", labelText: "Exit", action: {
                action(.exit)
            })
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .padding(.horizontal)
        .background(.ultraThinMaterial)
    }
    
    private func bottomItem(imageName: String, labelText: String, action: @escaping () -> Void) -> some View {
        
        Button (action: action){
            VStack (spacing: 8) {
                Image(systemName: imageName)
                    .aspectRatio(contentMode: .fill)
                    .fontWeight(.semibold)
                Text(labelText)
                    .font(.callout)
                    .fontWeight(.regular)
            }.frame(maxWidth: .infinity)
               
        }
            .buttonStyle(BottomButtonStyle())
        
    }
}

struct BottomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

#Preview {
    ReaderView()
}

