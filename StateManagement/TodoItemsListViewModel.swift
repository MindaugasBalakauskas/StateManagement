//
//  ContentViewModel.swift
//  StateManagement
//
//  Created by M Balakauskas on 14/10/2025.
//
import Combine
import Foundation


class TodoItemsListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    
    func loadItems() {
        guard todoItems.isEmpty else {return}
        do {
            self.todoItems = (try .fromJSON(named: "TodoItems"))
        } catch {
            fatalError("Failed to load TodoItems\(error)")
        }
       
    }
    func reoder() {
        todoItems.sort(by: { !$0.isDone && $1.isDone})
    }
}

