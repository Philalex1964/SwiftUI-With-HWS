//
//  AuthenticationStarterApp.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI
import Firebase

@main
struct AuthenticationStarterApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
