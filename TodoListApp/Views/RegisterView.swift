//
//  RegisterView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -10, background: Color.orange)
            
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Confirm Email Address", text: $viewModel.confirmEmail)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                
                TLButton(title: "Create Account", background: Color.orange){
                    viewModel.register()
                }
            }
            
            
           
            .offset(y: -100)
            
            
         
            
            
        }
    }
}

#Preview {
    RegisterView()
}
