//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Aleksandar Filipov on 4/7/22.
//

import SwiftUI
struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
        
//        List {
//            ForEach([2, 4, 6, 8, 10], id: \.self) {
//                Text("\($0) is even")
//            }
//        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
