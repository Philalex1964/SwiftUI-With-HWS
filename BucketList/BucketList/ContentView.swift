//
//  ContentView.swift
//  BucketList
//
//  Created by Aleksandar Filipov on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                FileManager.default.writeToDocumentDirectory("Text message", to: "text.txt")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




