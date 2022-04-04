//
//  ContentView.swift
//  Drawing
//
//  Created by Aleksandar Filipov on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                           .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
