//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/20/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
//        if sizeClass == .compact {
//            VStack {
//                UserView()
//            }
//        } else {
//            HStack {
//                UserView()
//            }
//        }
        
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

//struct ContentView: View {
//    @State private var layoutVertically = false
//
//    var body: some View {
//        Group {
//                    if layoutVertically {
//                        VStack {
//                            UserView()
//                        }
//                    } else {
//                        HStack {
//                            UserView()
//                        }
//                    }
//                }
//                .onTapGesture {
//                    layoutVertically.toggle()
//                }
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
