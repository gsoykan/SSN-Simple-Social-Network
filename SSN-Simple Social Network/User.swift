//
//  User.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

struct User: Codable,
             Equatable,
             Changeable {
    let name: String
    let username: String
    let profileImage: SSNImage
    var isCurrent: Bool?
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.username == rhs.username
    }
}
