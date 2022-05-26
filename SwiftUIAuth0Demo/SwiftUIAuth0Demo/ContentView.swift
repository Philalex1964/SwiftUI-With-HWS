//
//  ContentView.swift
//  SwiftUIAuth0Demo
//
//  Created by Aleksandar Filipov on 5/26/22.
//

import SwiftUI
import Auth0

struct ContentView: View {
    
    @State private var isAuthenticated = false
    @State var userProfile = Profile.empty
    
    var body: some View {
        if isAuthenticated {
            VStack {
                Text("Logged in")
                    .padding()
                
                AsyncImage(url: URL(string: userProfile.picture)) { image in
                    image
                        .frame(maxWidth: 128)
                } placeholder: {
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 128)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                .padding(40)
                
                VStack {
                    Text("Name: \(userProfile.name)")
                    Text("Email: \(userProfile.email)")
                }
                .padding()
                
                Button("Log out") {
                    logout()
                }
                .padding()
            }
        } else {
            VStack {
                Text("SwiftUI Login Demo")
                    .padding()
                
                Button("Log in") {
                    login()
                }
                .padding()
            }
        }
    }
}

extension ContentView {
    
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .failure(let error):
                    print("Failed with: \(error)")
                    
                case .success(let credentials):
                    isAuthenticated = true
                    userProfile = Profile.from(credentials.idToken)
                    print("Credentials: \(credentials)")
                    print("ID token: \(credentials.idToken)")
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .failure(let error):
                    print("Failed with: \(error)")
                    
                case .success:
                    isAuthenticated = false
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
