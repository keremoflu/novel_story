//
//  ExpandableView.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import SwiftUI

struct ExpandableView: View {
    
    @State var isCollapsed = false
    @Binding var text: String
    
    var body: some View {
            VStack (spacing: 32) {
                HStack {
                    Text("Summary")
                    Spacer()
                    Image(systemName: "arrowtriangle.up.fill")
                        .rotationEffect(.degrees(isCollapsed ? 0.0 : 180.0))
                        
                }
                .padding(.vertical, 8)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                }
                
                
                if isCollapsed {
                    Text(text)
                }
            }
            .padding()
    }
}

#Preview {
    ExpandableView(text: .constant(""))
}
