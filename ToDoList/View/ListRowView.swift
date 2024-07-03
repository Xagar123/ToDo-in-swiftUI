//
//  ListRowView.swift
//  ToDoList
//
//  Created by Aakash Dwivedy on 03/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    var title: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: title.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(title.isCompleted ? Color.green : Color.red)
            Text(title.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview {
    ListRowView(title: ItemModel(title: "This is first View", isCompleted: false))
}
