//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Aleksandar Filipov on 4/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.order.type) {
                        ForEach(Order.OrderStruct.types.indices) {
                            Text(Order.OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.order.quantity)", value: $order.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.order.specialRequestEnabled.animation())
                    
                    if order.order.specialRequestEnabled {
                        Toggle("Addd extra frosting?", isOn: $order.order.extraFrosting)
                        
                        Toggle("Addd extra sprinkles?", isOn: $order.order.addSprinkles)
                        
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
