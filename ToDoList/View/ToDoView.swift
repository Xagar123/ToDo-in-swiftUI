//
//  ToDoView.swift
//  ToDoList
//
//  Created by Aakash Dwivedy on 03/07/24.
//

import SwiftUI

struct ToDoView: View {
    
    @EnvironmentObject var listViewMode: ListViewModel
    
    
    
    var body: some View {
        ZStack{
            if listViewMode.items.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeIn ))
            } else {
                List {
                    ForEach(listViewMode.items ) { item in
                        ListRowView(title: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewMode.updateItem(item: item )
                                }
                            }
                    }
                    .onDelete(perform: listViewMode.deleteItem)
                    .onMove(perform: listViewMode.moveItem)
                }
            }
        }
        .navigationTitle("ToDoList 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            AddView()
        }))
    }
    
    
}

#Preview {
    NavigationView {
        ToDoView()
    }
    .environmentObject(ListViewModel())
  
}

