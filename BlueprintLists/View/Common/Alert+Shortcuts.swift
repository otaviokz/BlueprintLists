//
//  Alert+Shortcuts.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import SwiftUI

extension Alert {
    init(title: String, message: String, dismiss: String = "OK") {
        self.init(
            title: Text(title),
            message: Text(message),
            dismissButton: .cancel(Text(dismiss))
        )
    }
    
    static var genericError: Alert { Alert(title: genericErrorTitle, message: genericErrorMessage) }
    
    static var genericErrorTitle: String { "Whoops" }
    
    static var genericErrorMessage: String { "Unable to perform task, try again later." }
    
    static var genericErrorAlert = Alert(title: genericErrorTitle, message: genericErrorMessage)
}
