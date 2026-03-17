//
//  NewItemView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    
    @Binding var newItemPresented: Bool 
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true 
                    }
                    
                }
                
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title:Text( "Error"), message:
                        Text("Please fill in all fields and select a date from today and forward."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: { _ in
        
    } ))
}
