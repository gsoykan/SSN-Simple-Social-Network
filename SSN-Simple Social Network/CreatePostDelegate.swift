//
//  CreatePostDelegate.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

protocol CreatePostDelegate: BaseDelegate {
    func didCreatePost(_ post: Post)
}
