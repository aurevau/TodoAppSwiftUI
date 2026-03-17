//
//  TodoListItemsView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI
import FirebaseFirestore



struct TodoListView: View {
    
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String) {        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) {item in
                    TodoListItemView(item: item)
                    .swipeActions {
                        Button {
                            viewModel.delete(id: item.id)

                        } label: {
                            Text("Delete")
                        }.tint(Color.red)
                    }}
            }.listStyle(PlainListStyle())
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
    TodoListView(userId: "eCKp3TQuR1XaO5VkDj4SiuTp4wy2")
}
