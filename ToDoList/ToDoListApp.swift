//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Aakash Dwivedy on 03/07/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
