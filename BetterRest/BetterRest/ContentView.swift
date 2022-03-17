//
//  ContentView.swift
//  BetterRest
//
//  Created by Aleksandar Filipov on 3/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please, enter a date", selection: $wakeUp, in: Date.now...) //displayedComponents: .hourAndMinute)
//        .date)
//            .labelsHidden()
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
