//
//  ContentView.swift
//  StateManagement
//
//  Created by M Balakauskas on 11/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoItems: [TodoItem] = (try? .fromJSON(named: "TodoItems")) ?? []
    
    var body: some View {
        List($todoItems) { $todoItem in
            ToDoItemRow(item: $todoItem)
        }
    }
}

#Preview {
    ContentView()
}
