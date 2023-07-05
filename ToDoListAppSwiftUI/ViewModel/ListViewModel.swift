//
//  ListViewModel.swift
//  ToDoListAppSwiftUI
//
//  Created by Bhavin on 04/07/23.
//

import Foundation

/*
 CRUD Functions:
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemKey = "itemList"
    init() {
        getItems()
    }
    
    func getItems(){
        //MARK: Static Data
        //        items.append(ItemModel(title: "This is the first title", isCompleted: false))
        //        items.append(ItemModel(title: "This is the second title", isCompleted: true))
        //        items.append(ItemModel(title: "This is the third title", isCompleted: false))
        
        //        guard let data = UserDefaults.standard.data(forKey: itemKey) else { return }
        //        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        //MARK: Combine above guard let
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        //        Long Code
        //        if let index = items.firstIndex { (existingItem) in
        //            return existingItem.id == item.id
        //        } {
        //            items[index] = item.updateCompletion()
        //        }
        
        //Short Code
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
