//
//  TodoListItemsView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Your todos will appear here")
                        .foregroundColor(.gray)
            }
            .navigationTitle("Todo List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true 
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView )
            }
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
