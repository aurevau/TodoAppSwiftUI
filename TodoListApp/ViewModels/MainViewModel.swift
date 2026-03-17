//
//  MainViewModel.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation
import FirebaseAuth
import Combine

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {

        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in DispatchQueue.main.async {
            print("USER:", user?.uid ?? "nil")
            self?.currentUserId = user?.uid ?? ""}
        }
            
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
