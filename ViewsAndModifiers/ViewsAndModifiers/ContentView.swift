//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandar Filipov on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false

       var body: some View {
           Button("Hello World") {
               // flip the Boolean between true and false
               useRedText.toggle()
           }
           .foregroundColor(useRedText ? .red : .blue)
           
//           if/else alternative
           /*
            var body: some View {
                if useRedText {
                    Button("Hello World") {
                        useRedText.toggle()
                    }
                    .foregroundColor(.red)
                } else {
                    Button("Hello World") {
                        useRedText.toggle()
                    }
                    .foregroundColor(.blue)
                }
            }
            */
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
