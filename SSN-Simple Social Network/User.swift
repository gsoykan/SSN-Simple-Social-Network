//
//  User.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let profileImage: SSNImage
    var isCurrent: Bool?
}
