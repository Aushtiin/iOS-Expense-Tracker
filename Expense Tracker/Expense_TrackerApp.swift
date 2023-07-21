//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Austin  Tangban on 15/07/2023.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
