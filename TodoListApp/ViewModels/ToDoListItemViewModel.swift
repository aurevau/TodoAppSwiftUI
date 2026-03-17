//
//  ToDoListItemViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//
import FirebaseFirestore
import Foundation
import Combine

class ToDoListItemViewModel: ObservableObject {
    
    private let repo = TodoRepository()

    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        
    }
}
