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
    
    @StateObject var readerViewModel: ReaderViewModel 
    
    var body: some View {
        ZStack {
            
            //TEXT CONTENT
            VStack {
                GeometryReader { geometry in
                    let availableHeight = geometry.size.height
                    let textHeight = calculateTextHeight(forFontSize: currentFontSize)
                    
                    let adjustedFontSize = availableHeight / textHeight * currentFontSize
                    Text(readerViewModel.chapter1)
                        .font(.system(size: currentFontSize))
                        .id(currentFontSize)
                        .padding()
                }

            }.padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isHiddenMode.toggle()
                    }
                }
            
            //BOTTOM MENU
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
            
            //PAGE MOVE BUTTONS
            GeometryReader { proxy in
                HStack {
                    MoveToPageButton(geometryProxy: proxy)
                        .onTapGesture {
                            print("left")
                        }
                    
                    Spacer()
                    
                    MoveToPageButton(geometryProxy: proxy)
                        .onTapGesture {
                            print("right")
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .modifier(ChapterSheetModifier(isChapterVisible: $isChapterSheetVisible))
        .modifier(FontSizeSheetModifier(isFontSizeSheetVisible: $isFontSizeSheetVisible, currentFontSize: $currentFontSize))
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
    
    func calculateTextHeight(forFontSize fontSize: CGFloat) -> CGFloat {
        // Approximate a single line height based on the font size
        let lineHeight = fontSize * 1.2 // Adjust this multiplier as needed for line spacing
        let numberOfLines = readerViewModel.chapter1.split(separator: "\n").count
        return lineHeight * CGFloat(numberOfLines)
    }

}

private struct ChapterSheetModifier: ViewModifier {
    
    @Binding var isChapterVisible: Bool
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isChapterVisible, content: {
                ChapterListSheet()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            })
    }
}

private struct FontSizeSheetModifier: ViewModifier {
    
    @Binding var isFontSizeSheetVisible: Bool
    @Binding var currentFontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isFontSizeSheetVisible, content: {
                FontSizeSheet(value: $currentFontSize) { fontSize in
                    print("selected: \(fontSize)")
                    currentFontSize = CGFloat(fontSize)
                }
                    .presentationDetents([.height(160.0)])
                    .presentationDragIndicator(.visible)
            })
    }
}

private struct MoveToPageButton: View {
    
    var geometryProxy: GeometryProxy
    
    var body: some View {
        VStack {
            Spacer()
            Color.clear
                .frame(width: geometryProxy.size.width * 0.3, height: geometryProxy.size.height * 0.7)
                .contentShape(Rectangle())
                
            Spacer()
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
    ReaderView(readerViewModel: ReaderViewModel())
}

