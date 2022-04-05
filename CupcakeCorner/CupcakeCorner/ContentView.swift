//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Aleksandar Filipov on 4/5/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        1st way
/*       AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//            .resizable() - doesn'work
            .frame(width: 200, height: 200)
 */
//        2nd way

        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
//            Color.red
            ProgressView()
        }
        .frame(width: 200, height: 200)

//        3rd way
/*        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
 */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
