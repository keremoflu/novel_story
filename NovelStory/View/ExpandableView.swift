//
//  ExpandableView.swift
//  NovelStory
//
//  Created by Kerem on 10.07.2025.
//

import SwiftUI

struct ExpandableView: View {
    
    @State var isCollapsed = false
    
    var title: String
    @Binding var text: String
    
    var body: some View {
            VStack (spacing: 32) {
                HStack {
                    Text(title)
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.up.fill")
                        .rotationEffect(.degrees(isCollapsed ? 0.0 : 180.0))
                        
                }
                .padding(.vertical, 6)
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
    ExpandableView(title:"Title", text: .constant(""))
}
