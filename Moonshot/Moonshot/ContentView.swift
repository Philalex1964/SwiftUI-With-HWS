//
//  ContentView.swift
//  Moonshot
//
//  Created by Aleksandar Filipov on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Example")
            .resizable()
            .scaledToFill()
            .frame(width: 350, height: 350)
            .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
