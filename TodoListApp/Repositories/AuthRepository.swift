//
//  AuthRepository.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import FirebaseAuth


class AuthRepository {
    
    
    func login(email: String, password: String) async throws -> AuthDataResult {
        try await Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func register(email: String, password: String) async throws -> AuthDataResult {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func logOut()throws {
        try Auth.auth().signOut()
    }
    
}
