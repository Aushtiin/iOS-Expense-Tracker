//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Austin  Tangban on 15/07/2023.
//

import SwiftUI

struct ExpenseView: View {
    
    @AppStorage("darkMode") var isDarkMode = false
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var expenses: FetchedResults<Expense>
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        HStack {
                            Text("Welcome")
                                .font(.title)
                            Spacer()
                        }
                        
                        ForEach(expenses) { expense in
                            NavigationLink {
                                EditExpenseView(expense: expense)
                            } label: {
                                ExpenseDetail(amount: String(expense.amount), date: expense.date!, name: expense.name!, type: expense.type ?? "Transportation")
                            }
                            .contextMenu {
                                Button {
                                    deleteExpense(expense: expense)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }

                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Expenses")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    func deleteExpense(expense: Expense) {
        withAnimation {
            managedObjContext.delete(expense)
            
            do {
                try managedObjContext.save()
                print("Data saved successfully")
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved Error \(nsError)")
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
