//
//  ContentView.swift
//  NovelStory
//
//  Created by Kerem on 27.06.2025.
//

import SwiftUI

struct ReaderView: View {
    
    //Bottom Menu
    @State var isDarkMode: Bool = false
    @State var currentFontSize: CGFloat = 18.0
    @State var isChapterSheetVisible: Bool = false
    @State var isFontSizeSheetVisible: Bool = false
    
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
                    .font(.system(size: currentFontSize))
            }.padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isHiddenMode.toggle()
                    }
                }
            
            
            VStack {
                Spacer()
                if !isHiddenMode {
                    BottomView(isDarkMode: $isDarkMode, action: { item in
                        bottomMenuSelected(item: item)
                    })
                        .transition(
                            .move(edge: .bottom)
                            .combined(with: .opacity)
                        )
                }
                    
            }.ignoresSafeArea()
                
        }
        
        .sheet(isPresented: $isChapterSheetVisible, content: {
            ChapterListSheet()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        })
        .sheet(isPresented: $isFontSizeSheetVisible, content: {
            FontSizeSheet(value: $currentFontSize) { fontSize in
                print("selected: \(fontSize)")
                currentFontSize = CGFloat(fontSize)
            }
                .presentationDetents([.height(160.0)])
                .presentationDragIndicator(.visible)
        })
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationTitle("Book Name")
        .toolbarTitleDisplayMode(.inline)
        .tint(.black)
        .statusBarHidden(isHiddenMode)
        .toolbar(isHiddenMode ? .hidden : .visible, for: .navigationBar)
    }
    
    private func bottomMenuSelected(item: BottomView.BottomMenu) {
        switch item {
        case .chapter:
            isChapterSheetVisible.toggle()
        case .mode:
            isDarkMode.toggle()
        case .size:
            isFontSizeSheetVisible.toggle()
        case .exit:
            print("exit")
        }
    }
}

private struct BottomView: View {
    
    @Binding var isDarkMode: Bool
    enum BottomMenu {
        case chapter, mode, size, exit
    }
    
    var action: (BottomMenu) -> Void
    
    var body: some View {
        HStack (spacing: 32) {
            bottomItem(imageName: "list.dash", labelText: "Chapter", action: {
                action(.chapter)
            })
            
            bottomItem(imageName: isDarkMode ? "moon.fill" : "moon", labelText: "Mode", action: {
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

