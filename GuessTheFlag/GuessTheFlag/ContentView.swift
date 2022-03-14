//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aleksandar Filipov on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
            Text("Your content")
        }
        .ignoresSafeArea()
//        ZStack {
//            Color.red
//            Color(red: 1, green: 0.5, blue: 0.5)
//            Color.primary
//            Color.secondary
//                .frame(width: 200, height: 200)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Your context")
//                .background(.red)
//        }
//        .background(.red)
//        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
