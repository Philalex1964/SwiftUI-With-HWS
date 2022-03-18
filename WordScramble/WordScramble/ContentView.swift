//
//  ContentView.swift
//  WordScramble
//
//  Created by Aleksandar Filipov on 3/18/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hello")
    }
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
    }
    
    func test1() {
        let input = """
                    a
                    b
                    c
                    """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

    }
    
    func test3() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
