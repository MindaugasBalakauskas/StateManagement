//
//  ToDoItem.swift
//  StateManagement
//
//  Created by M Balakauskas on 11/10/2025.
//

import Foundation

struct ToDoItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var isDone: Bool = false
}
