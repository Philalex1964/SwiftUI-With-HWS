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
//            Text(user.id)
            Text("Age: \(user.age)")
            Text(user.company)
            Text(user.registered)
            Text(user.email)
            Text(user.address)
            Text(user.about)
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
//                    Text(friend.id)
                }
            } header: {
                Text("Friends")
            }
        }
        
        .frame(alignment: .leading)
        .navigationTitle(user.name)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static let user: User = DetailView().user
//
//    static var previews: some View {
//        DetailView(user: User)
//    }
//}
