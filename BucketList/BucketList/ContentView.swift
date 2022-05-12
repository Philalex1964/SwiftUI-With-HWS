//
//  ContentView.swift
//  BucketList
//
//  Created by Aleksandar Filipov on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                FileManager.default.writeToDocumentDirectory("Text message", to: "text.txt")
//                let str = "Test message"
//                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
            }
    }
    
//    func getDocumentsDirectory() -> URL {
//        // find all possible documents directories for this user
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        // just send back the first one, which ought to be the only one
//        return paths[0]
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension FileManager {
    func writeToDocumentDirectory(_ text: String, to file: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let url = paths[0].appendingPathComponent(file)
        
        do {
            try text.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
}


