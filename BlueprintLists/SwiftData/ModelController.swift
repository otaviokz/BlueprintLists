//
//  ModelController.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import Foundation
import SwiftData

class ModelController {
    private init() {}
    
    static let sharedInstance = ModelController()
    
    @MainActor
    var modelContainer: ModelContainer = {
        let schema = Schema([
            ToDoList.self
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: ModelController.isStoredInMemoryOnly
        )
        
        do {
            let container = try ModelContainer(for: ToDoList.self, configurations: modelConfiguration)
        
            if isTesting && isSimulator {
                try container.mainContext.delete(model: ToDoList.self)
            }
        
            return container

        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}

extension ModelController {
    static var isStoredInMemoryOnly: Bool {
        isTesting
    }
    
    static var isTesting: Bool {
        ProcessInfo.processInfo.arguments.contains("UITESTING")
    }
        
    static var isSimulator: Bool {
#if targetEnvironment(simulator)
        return true
#else
        return false
#endif
    }
}
