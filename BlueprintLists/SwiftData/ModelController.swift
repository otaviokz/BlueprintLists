//
//  ModelController.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import SwiftData

var sharedModelContainer: ModelContainer = {
    let schema = Schema([
        Item.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    
    do {
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()
