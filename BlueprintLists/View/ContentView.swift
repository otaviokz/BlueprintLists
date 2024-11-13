//
//  ContentView.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ToDoListsView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoList.self, inMemory: true)
}
