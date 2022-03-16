//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandar Filipov on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
                    Text("First")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())

                    Text("Second")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                }
    }
}
/*
 struct CapsuleText: View {
     var text: String

     var body: some View {
         Text(text)
             .font(.largeTitle)
             .padding()
             .foregroundColor(.white)
             .background(.blue)
             .clipShape(Capsule())
     }
 }
 
 struct ContentView: View {
     var body: some View {
         VStack(spacing: 10) {
 CapsuleText(text: "First")
         .foregroundColor(.white)
     CapsuleText(text: "Second")
         .foregroundColor(.yellow)
         }
     }
 }
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
