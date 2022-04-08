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

/*

As very rough guidance, you should:

Aim to use ternary conditional operators rather than use ifconditions.
Prefer to break large views up into smaller views rather than add complex logic in your view hierarchy.
Use Group to avoid the 10-view limit, or to add modifier such as navigationTitle() where it would otherwise not be possible.
Use an explicit @ViewBuilder only for simple properties, but be wary of using it to mask complex logic when really a new view might make more sense.
Fall back on AnyView if none of the other options would work.
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
