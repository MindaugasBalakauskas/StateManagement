//
//  ContentView.swift
//  StateManagement
//
//  Created by M Balakauskas on 11/10/2025.
//

import SwiftUI

struct TodoItemsListView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    NavigationLink(value: todoItem) {
                        ToDoItemRow(item: $todoItem.onNewValue {
                            viewModel.reorder()
                        })
                    }
//                   NavigationLink {
//                      TodoItemDetailView(item: $todoItem)
//                      } label: {
//                        ToDoItemRow(item: $todoItem.onNewValue {
//                              viewModel.reorder()
//                         })
//                   }
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's tasks")
            .navigationDestination(for: TodoItem.self, destination: { todoItem in
                let todoItemBinding = Binding(
                    get: { viewModel.todoItems.first(where: { $0.id == todoItem.id})! },
                    set: { newItem in
                        let index = viewModel.todoItems.firstIndex(where: {$0.id == todoItem.id})!
                        viewModel.todoItems[index] = newItem
                    }
                )
                TodoItemDetailView(item: todoItemBinding)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

#Preview {
    TodoItemsListView()
}
