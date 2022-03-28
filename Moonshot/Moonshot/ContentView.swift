//
//  ContentView.swift
//  Moonshot
//
//  Created by Aleksandar Filipov on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    let layout = [
//        GridItem(.fixed(80)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
