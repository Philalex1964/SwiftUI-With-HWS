//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandar Filipov on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        Button("Hello, world!"){
            print(type(of: self.body))
        }
//        Variant 1 with small red bg
//            .background(.red)
//            .frame(width: 200, height: 200)
        
//        Variant 2 with big red bg
        .frame(width: 200, height: 200)
        .background(.red)
         */
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
