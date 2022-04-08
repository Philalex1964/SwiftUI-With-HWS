//
//  ContentView.swift
//  Milestone10_12
//
//  Created by Aleksandar Filipov on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder var randomText: some View {
            if Bool.random() {
              Text("Hello, World!")
                    .frame(width: 300)
            } else {
                Text("Hello, World!1")
            }
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
