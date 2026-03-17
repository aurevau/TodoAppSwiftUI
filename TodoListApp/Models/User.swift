//
//  User.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
