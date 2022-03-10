//
//  ContentView.swift
//  LengthConverter
//
//  Created by Aleksandar Filipov on 3/10/22.
//

import SwiftUI


struct ContentView: View {
    @State private var unitSelected = "Not selected"
    @State private var inputNumber = 0.0
    
    @State private var outputUnit = "Not selected"
    @FocusState private var amountIsFocused: Bool
    
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()

    let units = ["km", "m", "dm", "cm", "mile", "yard", "foot", "inch"]
    
    let unitsDictionary = ["km": UnitLength.kilometers, "m": UnitLength.meters, "dm": UnitLength.decimeters, "cm": UnitLength.centimeters, "mile": UnitLength.miles, "yard": UnitLength.yards, "foot": UnitLength.feet, "inch": UnitLength.inches]
    
    var outputNumber: Double {
        let inputMeters = Measurement(value: inputNumber, unit: unitsDictionary[unitSelected] ?? .meters).converted(to: UnitLength.meters)
        
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
                    TextField("Input number", value: $inputNumber, formatter: numberFormatter)
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
