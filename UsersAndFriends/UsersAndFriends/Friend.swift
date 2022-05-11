//
//  Friend.swift
//  UsersAndFriends
//
//  Created by Aleksandar Filipov on 4/11/22.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    let id: String
    let name: String
}
