//
//  DataSchemaV1.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import SwiftData

struct DataSchemaV1: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    public static var models: [any PersistentModel.Type] {
        [ToDoList.self]
    }
}

extension DataSchemaV1 {
    @Model
    final class ToDoList {
        @Attribute(.unique) var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}
