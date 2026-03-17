//
//  ContentView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                    
                }
        }
    }
}

#Preview {
    MainView()
}
