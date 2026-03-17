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
                
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.pink)
                    .frame(width: 125, height: 125)
                    .padding()
                
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    ProgressView("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }.padding()
            
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }.padding()
            
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
            
        }.padding()
        
        Button("Log Out") {
            viewModel.logOut()
        }.tint(.pink)
            .padding()
            Spacer()
    }
}

#Preview {
    ProfileView()
}
