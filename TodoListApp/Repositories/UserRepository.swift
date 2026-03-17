//
//  UserRepository.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import FirebaseFirestore
class UserRepository {
    
    
    func saveUserToFirebase(id: String, name: String, email: String) async throws {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        try await db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        print("User saved successfully in Firestore!")

        
    }
}
