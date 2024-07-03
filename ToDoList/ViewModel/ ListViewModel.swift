//
//   ListViewModel.swift
//  ToDoList
//
//  Created by Aakash Dwivedy on 03/07/24.
//

import Foundation

/*
 CRUD ->
 CREATE
 READ
 UPDATE
 DELETE
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    var itemKey: String = "item_key"
    
    init() {
        getItem()
    }
    
    func getItem() {
//        let newItem = [
//            ItemModel(title: "This is first item", isCompleted: false),
//            ItemModel(title: "This is second item", isCompleted: true),
//            ItemModel(title: "This is third", isCompleted: false)
//        ]
//        items.append(contentsOf: newItem)
        
        // now we have to get the data from user default
        guard 
            let data = UserDefaults.standard.data(forKey: itemKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
//        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        // first we need to calculate the index of that perticular item
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKey )
        }
    }
}
