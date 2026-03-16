//
//  TLButton.swift
//  TodoListApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-16.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                
                Text(title)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(10)
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Value", background: Color.blue) {
        //Action 
    }
}
