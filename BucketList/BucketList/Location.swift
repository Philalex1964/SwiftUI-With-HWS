//
//  Location.swift
//  BucketList
//
//  Created by Aleksandar Filipov on 5/12/22.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
