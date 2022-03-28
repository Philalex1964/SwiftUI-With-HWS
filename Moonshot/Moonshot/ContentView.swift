//
//  ContentView.swift
//  Moonshot
//
//  Created by Aleksandar Filipov on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFill()
                .frame(height: geo.size.height * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
