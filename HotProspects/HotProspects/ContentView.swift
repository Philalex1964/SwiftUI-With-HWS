//
//  ContentView.swift
//  HotProspects
//
//  Created by Aleksandar Filipov on 5/16/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        List {
            Text("Taylor Swift")
//  MARK: Swipe actions
//                .swipeActions {
//                    Button {
//                        print("Hi")
//                    } label: {
//                        Label("Send message", systemImage: "message")
//                    }
//                }
                .swipeActions {
                            Button(role: .destructive) {
                                print("Hi")
                            } label: {
                                Label("Delete", systemImage: "minus.circle")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                print("Pin")
                            } label: {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.orange)
                        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
