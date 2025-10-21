//
//  ToDoItemRow.swift
//  StateManagement
//
//  Created by M Balakauskas on 11/10/2025.
//

import SwiftUI

struct ToDoItemRow: View {
    @Binding var item: TodoItem
    
    var body: some View {
        // Replace placeholder with a simple row layout for now
        HStack {
            TodoToggleButton(state: $item.isDone)
                .frame(width: 40, height: 40)
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                if let description = item.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct ToDoItemRow_Previews: PreviewProvider {
    static let todoItemWithoutDescription = TodoItem( id: UUID(), title: "Buy some bread 🥖")
    static let todoItemWithDescription = TodoItem( id: UUID(), title: "Buy some milk 🥛", description: "Get a lactose free one")
    
    
    
    static var previews: some View {
        Group {
            ToDoItemRow(item: .constant(todoItemWithoutDescription))
                .previewDisplayName("Without description")
            
            StatefulPreviewWrapper(todoItemWithDescription) { todoItem in ToDoItemRow(item: todoItem)
            }
            .previewDisplayName("With description")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
