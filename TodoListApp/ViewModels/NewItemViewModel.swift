//
//  NewItemViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import Combine

class NewItemViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    private let repo = TodoRepository()
    
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        Task {
            do {
                try await repo.saveTodoToFirestore(title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        
        // Create a model
        
        // Save model to databse
        
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
        
    }
}
