//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandar Filipov on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
//    3 ways to put multiple views in the property
    
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
   
    var spells1: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    
    var body: some View {
        VStack {
            motto1
                .background(.red)
            motto2
                .background(.blue)
            spells
            spells1
            spells2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
