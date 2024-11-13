//
//  BlueprintListsApp.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
// b b

import SwiftUI
import SwiftData

typealias ToDoList = DataSchemaV1.ToDoList

@main
struct BlueprintListsApp: App {
    let modelContainer = ModelController.sharedInstance.modelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
