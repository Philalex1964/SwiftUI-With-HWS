//
//  ContentView.swift
//  Milestone10_12
//
//  Created by Aleksandar Filipov on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var views = [AnyView]()

    var body: some View {
        VStack {
            Button("Add Shape") {
                if Bool.random() {
                    views.append(AnyView(Circle().frame(height: 50)))
                } else {
                    views.append(AnyView(Rectangle().frame(width: 50)))
                }
            }

            ForEach(0..<views.count, id: \.self) {
                views[$0]
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
