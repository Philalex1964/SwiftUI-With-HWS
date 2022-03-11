//
//  ContentView.swift
//  WeSplit
//
//  Created by Aleksandar Filipov on 2/25/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var tipAmount = ""
    @FocusState private var amountIsFocused: Bool
    let currency = Locale.current.currencyCode
    let placeHolder = "Amount"
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    var totalPerPreson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (Double(checkAmount) ?? 0) / 100 * tipSelection + (Double(tipAmount) ?? 0)
        let grandTotal = (Double(checkAmount) ?? 0) + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (Double(checkAmount) ?? 0) / 100 * tipSelection +  (Double(tipAmount) ?? 0)
        let grandTotal = (Double(checkAmount) ?? 0) + tipValue
        print(currency!)
        return grandTotal
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(placeHolder, text: $checkAmount, onEditingChanged: { editing in
                        if editing {
                            checkAmount = ""
                        }
                    })
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<15) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("Amount spent in " + (currency ?? "USD"))
                }
                
                Section {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    TextField(placeHolder, text: $tipAmount, onEditingChanged: { editing in
                        if editing {
                            tipAmount = ""
                        }
                    })
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Or tip fixed amount in " + (currency ?? "USD"))
                }
                
                Section {
                    Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total amount")
                }
                
                Section {
                        Text(totalPerPreson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
