//
//  ProfileViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    
    @Published var user: User? = nil
    private let repo = AuthRepository()
    private let userRepo = UserRepository()


    init() {}
    

    func logOut() {
        do {
            try repo.logOut()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func fetchUser() {
        Task {
            do {
                let fetchedUser = try await userRepo.fetchUser()
                
                await MainActor.run {
                    user = fetchedUser
                }
            }
            catch {
                await MainActor.run {
                    errorMessage = "Failed to fetch user data"
                }
            }
        }
    }
    
}
