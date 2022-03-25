//
//  Expenses.swift
//  iExpense
//
//  Created by Aleksandar Filipov on 3/25/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
