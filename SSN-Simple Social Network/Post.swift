//
//  Post.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

struct Post: Codable {
    let user: User
    let text: String
    let image: SSNImage
}
