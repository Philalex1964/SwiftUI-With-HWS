//
//  ContentView.swift
//  Drawing
//
//  Created by Aleksandar Filipov on 3/29/22.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
