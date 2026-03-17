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
    
    @Published var errorMessage = ""

    private let repo = TodoRepository()

    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        Task {
            do {
                try await repo.updateToggledTodo(itemCopy: itemCopy)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
      
    }
}
