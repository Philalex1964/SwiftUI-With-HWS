//
//  DetailView.swift
//  UsersAndFriends
//
//  Created by Aleksandar Filipov on 4/13/22.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("UserID: \(user.id)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Registraton date: \(user.registered)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("About:")
                Text(user.about)
            }
            .frame(alignment: .leading)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Section {
                    ForEach(user.friends) { friend in
                        HStack {
                            Text(friend.name)
                            Text(friend.id)
                                .font(.caption)
                        }
                    }
                } header: {
                    Text("Friends:")
                        .font(.headline)
                }
            }
            .frame(alignment: .leading)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DetailView(user: User(id: "12345", isActive: true, name: "Alex", age: 58, company: "Vega", email: "123@mail.com", address: "Beograde", about: "ioetqroutyroiotr", registered: "02.02.22", tags: [], friends: []))
    }
}
