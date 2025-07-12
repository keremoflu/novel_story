//
//  FontSizeSheet.swift
//  NovelStory
//
//  Created by Kerem on 3.07.2025.
//

import SwiftUI

struct FontSizeSheet: View {
    
    @Binding var value: CGFloat
    var action: (Int) -> Void
    
    var body: some View {
       
        VStack {
            Text("Size: \(Int(value))")
                .font(.system(size: 20.0))
                .fontWeight(.semibold)
            HStack (spacing: 16) {
                Text("Aa")
                    .font(.system(size: 14))
                    .padding(.bottom)
                Slider(value: $value, in: 18...24, step: 1.0)
//                    .onChange(of: value) { oldValue, newValue in
//                        print("new val: \(newValue)")
//                        action(Int(newValue))
//                    }
                Text("Aa")
                    .font(.system(size: 20))
                    .padding(.bottom)
            }.padding()
        }
            
    }
}

#Preview {
    FontSizeSheet(value: .constant(18.0), action: {_ in 
        
    })
}
