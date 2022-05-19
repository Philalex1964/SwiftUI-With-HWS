//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Aleksandar Filipov on 5/19/22.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
////            .padding(20)
//            .background(.red)
//            .padding(20)
//    }
//    var body: some View {
//        Color.red
//    }
    var body: some View {
        Image("Example")
            .resizable()
            .frame(width: 300, height: 300)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
