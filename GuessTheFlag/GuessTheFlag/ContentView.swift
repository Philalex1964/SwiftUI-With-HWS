//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aleksandar Filipov on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.white, .blue, .black]), startPoint: .top, endPoint: .bottom)
//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ]), startPoint: .top, endPoint: .bottom)
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
        ]), startPoint: .top, endPoint: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
