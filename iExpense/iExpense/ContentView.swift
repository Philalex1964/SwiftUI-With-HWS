//
//  ContentView.swift
//  iExpense
//
//  Created by Aleksandar Filipov on 3/25/22.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Spacer()
        
        Text("Hello, \(name)")
        
        Spacer()
        
        Button("Dismiss") {
            dismiss()
        }
        
        Spacer()
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@twostraws")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
