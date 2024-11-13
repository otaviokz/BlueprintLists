//
//  ToDoListsView.swift
//  BlueprintLists
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import SwiftUI
import SwiftData

struct ToDoListsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\ToDoList.name, order: .forward)]) private var todDoLists: [ToDoList]
    @State private var presentAlert: Bool = false
    
    var body: some View {
        List {
            ForEach(todDoLists) { list in
                Text(list.name)
            }
            .onDelete(perform: deleteLists)
        }
        .navigationBarTitle("Blueprint Lists")
        .navigationBarItems(
            trailing: Button(action: { addToDoList() }, label: { Image.plus }).accessibilityIdentifier("plus")
        )
        .alert(isPresented: $presentAlert) {
            Alert.genericErrorAlert
        }
    }
}

extension ToDoListsView {
    private func addToDoList() {
        withAnimation {
            let newToDoList = ToDoList(name: "List -  \(todDoLists.count + 1)")
            modelContext.insert(newToDoList)
            do {
                try modelContext.save()
            } catch {
                presentAlert = true
            }
        }
    }
    
    private func deleteLists(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todDoLists[index])
            }
        }
    }    
}

#Preview {
    ToDoListsView()
}
