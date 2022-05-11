//
//  ContentView.swift
//  Instafilter
//
//  Created by Aleksandar Filipov on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
//  Observer works for the button, but doesn't work for the Slider
//    {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .blur(radius: blurAmount)

                Slider(value: $blurAmount, in: 0...20)

                Button("Random Blur") {
                    blurAmount = Double.random(in: 0...20)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
