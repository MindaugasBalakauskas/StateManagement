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
        List($viewModel.todoItems) { $todoItem in
            ToDoItemRow(item: $todoItem)
        }
        .onAppear {
            viewModel.loadItems()
        }
    }
}

#Preview {
    TodoItemsListView()
}
