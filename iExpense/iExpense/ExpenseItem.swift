//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Aleksandar Filipov on 3/25/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
