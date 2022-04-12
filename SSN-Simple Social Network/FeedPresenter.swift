//
//  FeedPresenter.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

class FeedPresenter {
    weak var delegate: FeedDelegate!
    
    init(delegate: FeedDelegate) {
        self.delegate = delegate
    }
    
    var currentUserIndex: Int? {
        get { UserRepository.shared.currentUserWithIndex.1 }
    }
    
    func loadPosts() {
        delegate.posts = PostRepository.shared.getInfo()
        delegate.setDropDownUsers()
    }
    
    func setCurrentUser(_ userIndex: Int) {
        guard let user = UserRepository.shared.elements?[safeIndex: userIndex] else {
            return
        }
        UserRepository.shared.setCurrentUser(user)
    }
}
