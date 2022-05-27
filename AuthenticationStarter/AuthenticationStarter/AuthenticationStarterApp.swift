//
//  AuthenticationStarterApp.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct AuthenticationStarterApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
        
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(viewModel)
        }
    }
}
