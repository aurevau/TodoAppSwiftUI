//
//  LoginView.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Todo List", subTitle: "Get things done", angle: 10, background: Color.pink)
                Spacer()
                
                
                Form {
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TLButton(title: "Login", background: Color.pink){
                        viewModel.login()
                    }
                }
                .offset(y: -80)
                
                VStack {
                    Text("New around here?")
                 
                        NavigationLink("Create an Account", destination: RegisterView())
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
