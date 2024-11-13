//
//  BlueprintListsApp.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
// b b

import SwiftUI
import SwiftData

@main
struct BlueprintListsApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
