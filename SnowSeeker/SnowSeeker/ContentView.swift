//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/20/22.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

//struct ContentView: View {
//    @State private var selectedUser: User? = nil
//
//    var body: some View {
//        Text("Hello, World!")
//            .onTapGesture {
//                    selectedUser = User()
//                }
//                .sheet(item: $selectedUser) { user in
//                    Text(user.id)
//                }
//    }
//}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
//            .sheet(isPresented: $isShowingUser) {
//                Text(selectedUser?.id ?? "Unknown")
//            }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Button(user.id) { }
//            }
//            .alert("Welcome", isPresented: $isShowingUser) {
//                Button("OK") { }
//            }
            .alert("Welcome", isPresented: $isShowingUser) { }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
