//
//  ContentView.swift
//  Flashzilla
//
//  Created by Aleksandar Filipov on 5/18/22.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 10) {
//            Text("Double tapped!")
//                .onTapGesture(count: 2) {
//                        print("Double tapped!")
//                }
//
//            Text("Long pressed!")
//                .onLongPressGesture(minimumDuration: 1) {
//                        print("Long pressed!")
//                    } onPressingChanged: { inProgress in
//                        print("In progress: \(inProgress)!")
//                    }
//        }
//
//    }
//}

//struct ContentView: View {
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
//
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { amount in
//                        currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
//    }
//}

//struct ContentView: View {
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
//
//    var body: some View {
//        Text("Hello, World!")
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotationGesture()
//                    .onChanged { angle in
//                        currentAmount = angle
//                    }
//                    .onEnded { angle in
//                        finalAmount += currentAmount
//                        currentAmount = .zero
//                    }
//            )
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        //        .onTapGesture {
//        //            print("VStack tapped")
//        //        }
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("VStack tapped")
//                }
//        )
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("VStack tapped")
//                }
//        )
//    }
//}

struct ContentView: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero

    // whether it is currently being dragged or not
    @State private var isDragging = false

    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }

        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)

        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
