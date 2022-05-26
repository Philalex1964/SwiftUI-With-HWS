//
//  AuthenticationStarterApp.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI

@main
struct AuthenticationStarterApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
