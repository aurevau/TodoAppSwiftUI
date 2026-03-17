//
//  ToDoListItem.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
