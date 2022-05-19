//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Aleksandar Filipov on 5/19/22.
//

import SwiftUI

extension VerticalAlignment {
//    struct MidAccountAndName: AlignmentID {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
//    var body: some View {
//        HStack {
//            VStack {
//                Text("@twostraws")
//                Image("Example")
//                    .resizable()
//                    .frame(width: 64, height: 64)
//            }
//
//            VStack {
//                Text("Full name:")
//                Text("PAUL HUDSON")
//                    .font(.largeTitle)
//            }
//        }
//    }
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("Example")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
