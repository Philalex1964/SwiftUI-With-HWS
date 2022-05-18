//
//  ContentView.swift
//  Flashzilla
//
//  Created by Aleksandar Filipov on 5/18/22.
//

import SwiftUI

//struct ContentView: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//
//    var body: some View {
//            HStack {
//                if differentiateWithoutColor {
//                    Image(systemName: "checkmark.circle")
//                }
//
//                Text("Success")
//            }
//            .padding()
//            .background(differentiateWithoutColor ? .black : .green)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//        }
//}
//func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
//    if UIAccessibility.isReduceMotionEnabled {
//        return try body()
//    } else {
//        return try withAnimation(animation, body)
//    }
//}
//
//struct ContentView: View {
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
//    @State private var scale = 1.0
//
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(scale)
//            .onTapGesture {
//                withOptionalAnimation {
//                    scale *= 1.5
//                }
//                //                if reduceMotion {
//                //                    scale *= 1.5
//                //                } else {
//                //                    withAnimation {
//                //                        scale *= 1.5
//                //                    }
//                //                }
//            }
//    }
//}

struct ContentView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
