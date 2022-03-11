//
//  ContentView.swift
//  LengthConverter
//
//  Created by Aleksandar Filipov on 3/10/22.
//

import SwiftUI


struct ContentView: View {
    @State private var unitSelected = "m"
    @State private var inputNumber = "1"
    @State private var placeHolder = "Input number"
    @State private var outputUnit = "m"
    @FocusState private var amountIsFocused: Bool
    

    let units = ["km", "m", "dm", "cm", "mile", "yard", "foot", "inch"]
    
    let unitsDictionary = ["km": UnitLength.kilometers, "m": UnitLength.meters, "dm": UnitLength.decimeters, "cm": UnitLength.centimeters, "mile": UnitLength.miles, "yard": UnitLength.yards, "foot": UnitLength.feet, "inch": UnitLength.inches]
    
    var outputNumber: Double {
        let inputMeters = Measurement(value: Double(inputNumber) ?? 1, unit: unitsDictionary[unitSelected] ?? .meters).converted(to: UnitLength.meters)
        
        let output = Measurement(value: inputMeters.value, unit: UnitLength.meters) .converted(to: unitsDictionary[outputUnit] ?? .meters)
        
        
        return output.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Unit", selection: $unitSelected) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Please, choose input unit")
                }
                
                Section {
                    TextField(placeHolder, text: $inputNumber, onEditingChanged: { editing in
                        if editing {
                            inputNumber = ""
                        }
                    })
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Please, input number")
                }
                
                Section {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Please, choose output unit")
                }
                
                Section {
                    Text(outputNumber.formatted())
                } header: {
                    Text("Your output")
                }
            }
            
            .navigationTitle("Length Converter")
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
