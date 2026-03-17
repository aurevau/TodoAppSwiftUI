//
//  ProfileView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Profile ")
                        .foregroundColor(.gray)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
