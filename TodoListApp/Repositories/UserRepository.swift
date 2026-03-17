//
//  UserRepository.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class UserRepository {
    
    let db = Firestore.firestore()

    func saveUserToFirebase(id: String, name: String, email: String) async throws {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        
        try await db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        print("User saved successfully in Firestore!")

        
    }
    
    func fetchUser() async throws -> User {
        guard let userId =  Auth.auth().currentUser?.uid else {
            throw NSError(domain: "NoUser", code: 0)
        }
        
       let snapshot =  try await db.collection("users")
            .document(userId)
            .getDocument()
        
        guard let user = try? snapshot.data(as: User.self) else {
            throw NSError(domain: "DecodingError", code: 0)

        }
        return user
        
    }
}
