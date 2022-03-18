//
//  ContentView.swift
//  WordScramble
//
//  Created by Aleksandar Filipov on 3/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
// List w/out ForEach
        List(0..<5) {
            Text("Dynamic rows \($0)")
//  List can generate its rows entirely from dynamic content without needing a ForEach.
            
//            Section("Section 1") {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section("Section 2") {
//                ForEach(0..<7
//                ) {
//                    Text("Dynamic rows \($0)")
//                }
//            }
//
//            Section("Section 3") {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
