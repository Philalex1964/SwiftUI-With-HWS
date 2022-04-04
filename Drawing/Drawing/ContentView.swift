//
//  ContentView.swift
//  Drawing
//
//  Created by Aleksandar Filipov on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Image("Example")
                .colorMultiply(.yellow)

//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
