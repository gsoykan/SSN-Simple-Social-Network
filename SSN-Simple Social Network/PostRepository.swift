//
//  PostRepository.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

class PostRepository: DataRepository {
    typealias T = Post
    
    static var shared = PostRepository()
    
    internal var userDefaults: UserDefaults
    var elements: [Post]?
    internal var key: String
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.key = Constants.Repository.postsKey
        self.elements = getInfo()
    }
}
