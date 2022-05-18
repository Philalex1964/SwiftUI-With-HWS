//
//  ContentView.swift
//  Flashzilla
//
//  Created by Aleksandar Filipov on 5/18/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
