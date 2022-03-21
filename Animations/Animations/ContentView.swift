//
//  ContentView.swift
//  Animations
//
//  Created by Aleksandar Filipov on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding()
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.easeOut, value: animationAmount)
//        .animation(.easeIn, value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
//        .animation(.easeInOut(duration: 2)
//            .delay(1),
//        value: animationAmount)
//        .animation(.easeInOut(duration: 1)
//            .repeatCount(2, autoreverses: true),
//        value: animationAmount)
        .animation(.easeInOut(duration: 1)
            .repeatForever(autoreverses: true),
        value: animationAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
