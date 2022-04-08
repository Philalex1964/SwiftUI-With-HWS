//
//  ContentView.swift
//  Milestone10_12
//
//  Created by Aleksandar Filipov on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    var randomText: some View {
        Text("Hello, World!")
            .frame(width: Bool.random() ? 300 : nil)
            .background(.red)
    }
    
    var body: some View {
        randomText
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
