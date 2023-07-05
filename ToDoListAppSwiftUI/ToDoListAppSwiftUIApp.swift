//
//  ToDoListAppSwiftUIApp.swift
//  ToDoListAppSwiftUI
//
//  Created by Bhavin on 03/07/23.
//

import SwiftUI

/*
 MVVM: Model View ViewModel
 M : Data Point
 V : View (UI)
 VM: Manages Models for View
 */

@main
struct ToDoListAppSwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
