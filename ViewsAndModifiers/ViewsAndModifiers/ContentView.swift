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
//           Envirement modifier can be overrided
           VStack {
               Text("Gryffindor")
                   .font(.largeTitle)
               Text("Hufflepuff")
               Text("Ravenclaw")
               Text("Slytherin")
           }
           .font(.title)
           
           Spacer()
           
//           Regular modifier - can not
           VStack {
               Text("Gryffindor")
                   .blur(radius: 0)
               Text("Hufflepuff")
               Text("Ravenclaw")
               Text("Slytherin")
           }
           .blur(radius: 5)
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
