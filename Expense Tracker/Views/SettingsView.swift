//
//  SettingsView.swift
//  Expense Tracker
//
//  Created by Austin  Tangban on 15/07/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("darkMode") var isDarkMode = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                Section("About") {
                    Text("This app helps you manage your expenses.")
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
