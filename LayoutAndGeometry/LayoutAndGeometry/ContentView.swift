//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Aleksandar Filipov on 5/19/22.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        GeometryReader { geo in
//                    Text("Hello, World!")
//                        .frame(width: geo.size.width * 0.9)
//                        .background(.red)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9, height: 40)
//                    .background(.red)
//            }
//            .background(.green)
//
//            Text("More text")
//            Text("More text")
//            Text("More text")
//            Text("More text")
//                .background(.blue)
//        }
//    }
//}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
