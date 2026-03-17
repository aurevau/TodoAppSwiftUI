//
//  RegisterViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import Combine
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var confirmEmail = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    
    private let authRepo = AuthRepository()
    private let userRepo = UserRepository()

    
    init() {}
    
    func register() {
        guard validate() else {
            return 
        }
        
        Task {
            do{
                let result = try await authRepo.register(email: email, password: password)
                let userId = result.user.uid
                
                print(userId)
                try await userRepo.saveUserToFirebase(id: userId, name: name, email: email)
        
                print("Registration complete and user saved!")

            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
       
    }
    
    
    
          
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !confirmEmail.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty, !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false
            
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter a password of min 6 characters"
            return false 
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        guard email == confirmEmail else {
            errorMessage = "Email is not matching."
            return false
        }
        
        guard password == confirmPassword else {
            errorMessage = "Password is not matching."
            return false
        }
        
        return true
        
    }
}
