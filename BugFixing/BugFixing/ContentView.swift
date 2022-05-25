//
//  ContentView.swift
//  BugFixing
//
//  Created by Aleksandar Filipov on 5/25/22.
//

import SwiftUI

// Adding views and modifiers where they aren’t needed
//struct ContentView: View {
//    var body: some View {
////        Rectangle()
////            .fill(Color.red)
//        Color.red
////            .clipShape(RoundedRectangle(cornerRadius: 50))
//            .cornerRadius(50)
//    }
//}

//Using @ObservedObject when they mean @StateObject
//class DataModel: ObservableObject {
//    @Published var username = "@twostraws"
//}
//
//struct ContentView: View {
//// !!!!!   @ObservedObject var model = DataModel()
//    @StateObject var model = DataModel()
//
//    var body: some View {
//        Text(model.username)
//    }
//}

// Putting modifiers in the wrong order
//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .background(Color.green)
//            .padding()
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .padding()
//            .background(Color.green)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .offset(x: 15, y: 15)
//            .background(Color.green)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .background(Color.green)
//            .offset(x: 15, y: 15)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .background(Color.green)
//            .position(x: 150, y: 150)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .position(x: 150, y: 150)
//            .background(Color.green) // full screen
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .padding()
//            .background(Color.green)
//            .padding()
//            .background(Color.blue)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .foregroundColor(.white)
//            .shadow(color: .black, radius: 10)
//            .shadow(color: .black, radius: 10)
//            .shadow(color: .black, radius: 10)
//    }
//}

// Attaching property observers to property wrappers

//struct ContentView: View {
//    @State private var rating = 0.0
////    {
////        didSet {
////            print("Rating changed to \(rating)")
////        }
////    }
//
//    var body: some View {
//        Slider(value: $rating)
//            .onChange(of: rating) { value in
//                print("Rating changed to \(value)")
//            }
//    }
//}

//struct ContentView: View {
//    @State private var rating = 0.0
//
//    var body: some View {
//        Slider(value: $rating.onChange(sliderChanged))
//    }
//
//    func sliderChanged(_ value: Double) {
//        print("Rating changed to \(value)")
//    }
//}
//
//extension Binding {
//    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
//        Binding(
//            get: { self.wrappedValue },
//            set: { newValue in
//                self.wrappedValue = newValue
//                handler(newValue)
//            }
//        )
//    }
//}


// Stroking shapes when they mean to stroke the border

//struct ContentView: View {
//    var body: some View {
////        Circle()
//////            .stroke(Color.red, lineWidth: 20)
////            .strokeBorder(Color.red, lineWidth: 20)
//
//        Circle()
//            .stroke(style: StrokeStyle(lineWidth: 20, dash: [10]))
//            .stroke(style: StrokeStyle(lineWidth: 20, dash: [10]))
//            .frame(width: 280, height: 280)
//    }
//}


// 6. Using alerts and sheets with optionals


struct User: Identifiable {
    let id: String
}

// Optional alert
//struct ContentView: View {
//    @State private var selectedUser: User?
//    @State private var showingAlert = false
//
//    var body: some View {
//        VStack {
//            Button("Show Alert") {
//                selectedUser = User(id: "@twostraws")
//                showingAlert = true
//            }
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Hello, \(selectedUser!.id)"))
//        }
//    }
//}

//struct ContentView: View {
//    @State private var selectedUser: User?
//
//    var body: some View {
//        VStack {
//            Button("Show Alert") {
//                selectedUser = User(id: "@alex")
//            }
//        }
//        .alert(item: $selectedUser) { user in
//            Alert(title: Text("Hello, \(user.id)"))
//        }
//    }
//}

//7. Trying to get “behind” your SwiftUI view

//struct ContentView: View {
//    var body: some View {
////        Text("Hello, World!")
////            .background(Color.red)
//
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .ignoresSafeArea()
//    }
//}

// 8. Creating dynamic views using invalid ranges

// crash
struct ContentView: View {
    @State private var rowCount = 4

    var body: some View {
        VStack {
            Button("Add Row") {
                rowCount += 1
            }
            .padding(.top)
//            List(0..<rowCount) { row in
//                Text("Row \(row)")
//        }
            List(0..<rowCount, id: \.self) { row in
                Text("Row \(row)")
            
            }
        }
    }
}


//struct ContentView: View {
//    var body: some View {
//        Text("Hello")
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
