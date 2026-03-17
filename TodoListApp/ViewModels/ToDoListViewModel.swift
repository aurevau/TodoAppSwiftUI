//
//  ToDoListViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import Combine

class ToDoListViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    @Published var errorMessage = ""

    
    private let repo = TodoRepository()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        Task {
            do {
                try await repo.deleteTodoFromFirebase(id: id, userId: userId)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
}
