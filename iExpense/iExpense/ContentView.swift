//
//  ContentView.swift
//  iExpense
//
//  Created by Aleksandar Filipov on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .font((item.amount > 100) ? .title : ((item.amount > 10) ? .title2 : .headline))
                                }
                            }
//                                .accessibilityElement()
//                                .accessibility(label: "\(item.name) \(item.amount)")
                        }
                        .onDelete(perform: removeItems)
                    }
                } header: {
                    Text("Personal")
                }
                
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .font((item.amount > 100) ? .title : ((item.amount > 10) ? .title2 : .headline))
                                }
                            }
//                                .accessibilityElement()
//                                .accessibility(label: "\(item.name) \(item.amount)")
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                header: {
                    Text("Business")
                }
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
