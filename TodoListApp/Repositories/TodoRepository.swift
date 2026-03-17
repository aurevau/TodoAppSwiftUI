//
//  TodoRepository.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-17.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class TodoRepository {
    
    func saveTodoToFirestore(title: String, dueDate: TimeInterval, createdDate: TimeInterval) async throws {
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate, createdDate: createdDate, isDone: false)
        
        let db = Firestore.firestore()
        
        try await db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
}
