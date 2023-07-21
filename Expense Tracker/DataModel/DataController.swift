//
//  DataController.swift
//  Expense Tracker
//
//  Created by Austin  Tangban on 15/07/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ExpenseTracker")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}
