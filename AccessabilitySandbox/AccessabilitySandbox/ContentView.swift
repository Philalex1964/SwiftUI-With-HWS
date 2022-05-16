//
//  ContentView.swift
//  AccessabilitySandbox
//
//  Created by Aleksandar Filipov on 5/16/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Image(decorative: "ales-krivec-15949")
            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
//        .accessibilityElement(children: .combine)
        .accessibilityElement(children: .ignore) //is default. can be used as .accessibilityElement()
        .accessibilityLabel("Your score is 1000")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
