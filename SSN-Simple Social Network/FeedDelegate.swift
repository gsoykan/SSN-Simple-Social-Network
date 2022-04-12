//
//  FeedDelegate.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

protocol FeedDelegate: BaseDelegate {
    var posts: [Post]? {get set}
    func setDropDownUsers()
    func addNewPost(_ post: Post)
}
