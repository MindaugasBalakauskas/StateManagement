//
//  ToDoItemRow.swift
//  StateManagement
//
//  Created by M Balakauskas on 11/10/2025.
//

import SwiftUI

struct ToDoItemRow: View {
    @Binding var item: ToDoItem
    var body: some View {
        // Replace placeholder with a simple row layout for now
        HStack {
            Button("Button") {
                item.isDone.toggle()
            }
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                if let description = item.description, !description.isEmpty {
                    Text("— \(description)")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            .padding(.leading)
            Spacer()
        }
        .padding()
        .frame(height: 70)
    }
}

struct ToDoItemRow_Previews: PreviewProvider {
    static let todoItemWithoutDescription = ToDoItem(id: UUID(), title: "Buy some bread🥖")
    static let todoItemWithDescription = ToDoItem(id: UUID(), title: "Buy some milk🥛", description: "Get a lactose free one")

    static var previews: some View {
        Group {
            ToDoItemRow(item: .constant(todoItemWithoutDescription))
                .previewDisplayName("No description")
            StatefulPreviewWrapper(todoItemWithoutDescription) { todoItem in ToDoItemRow(item: todoItem)}
            
            ToDoItemRow(item: .constant(todoItemWithDescription))
                .previewDisplayName("With description")
            StatefulPreviewWrapper(todoItemWithDescription) { todoItem in ToDoItemRow(item: todoItem)}
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
