//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Aleksandar Filipov on 5/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
//            .background(.red)
//            .position(x: 100, y: 100)
//            .offset(x: 100, y: 100)
            .background(.red)
            .offset(x: 100, y: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
