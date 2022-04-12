//
//  UserRepository.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

class UserRepository: DataRepository {
    typealias T = User
    
    static var shared = UserRepository()
    
    internal var userDefaults: UserDefaults
    var elements: [User]?
    var currentUser: User? {
        get { self.elements?.first{ $0.isCurrent == true} ?? self.elements?.first }
    }
    
    internal var key: String
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.key = Constants.Repository.usersKey
        self.elements = getInfo()
    }
    
    func setCurrentUser(_ user: User) {
        // TODO: @gsoykan implement
    }
}
