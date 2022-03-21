//
//  ContentView.swift
//  Animations
//
//  Created by Aleksandar Filipov on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
//              Explicit animation
                        .onEnded { _ in
                            withAnimation{
                                dragAmount = .zero }
                        }
                )
//              Implicit animation
//                .animation(.spring(), value: dragAmount)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
