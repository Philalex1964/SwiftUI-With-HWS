//
//  User.swift
//  UsersAndFriends
//
//  Created by Aleksandar Filipov on 4/11/22.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}
