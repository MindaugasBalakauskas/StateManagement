//
//  TodoToggleButton.swift
//  StateManagement
//
//  Created by M Balakauskas on 14/10/2025.
//

import SwiftUI

struct TodoToggleButton: View {
    @Binding var state: Bool
    
    var body: some View {
        Button {
            withAnimation {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2))
                        .foregroundColor(.blue)
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                            .foregroundColor(.blue)
                    }
                }
                .padding(8)
            }
        }
        .scaledToFit()
    }
}

#Preview(traits: .fixedLayout(width: 100, height: 100)) {
    StatefulPreviewWrapper(false) { state in
        TodoToggleButton(state: state)
    }
}
