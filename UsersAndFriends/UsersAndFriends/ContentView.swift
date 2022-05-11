//
//  ContentView.swift
//  UsersAndFriends
//
//  Created by Aleksandar Filipov on 4/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        DetailView(user: user)
                            .navigationTitle(user.name)
                    } label: {
                            HStack {
                                Text(user.name)
                                    .font(.headline)
                                    .bold()
                                Spacer()
                                Text(user.isActive ? "User is active" : "User is not active")
                            }
                            .padding()
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                if users.isEmpty {
                    await loadData()
                } else {
                    print(users[1].name)
                }
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
