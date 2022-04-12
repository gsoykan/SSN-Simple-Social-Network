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
    var currentUserWithIndex: (User?, Int?) {
        get {
            let index = self.elements?.firstIndex(where: { $0.isCurrent == true}) ?? 0
            let user = elements?[safeIndex: index]
            return (user, index)
        }
    }
    
    internal var key: String
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.key = Constants.Repository.usersKey
        self.elements = getInfo()
    }
    
    func setCurrentUser(_ user: User) {
        let updatedElements = elements?.enumerated().map({ (enumeratedUser) in
            return enumeratedUser.element.change(path: \.isCurrent, to: enumeratedUser.element == user ? true : false)
        }) ?? []
        storeInfo(data: updatedElements)
    }
}
