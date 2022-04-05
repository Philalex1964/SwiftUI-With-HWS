//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Aleksandar Filipov on 4/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disabledForm)
        }
    }
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
