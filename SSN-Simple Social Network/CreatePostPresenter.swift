//
//  CreatePostPresenter.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

class CreatePostPresenter {
    weak var delegate: CreatePostDelegate!
    
    init(delegate: CreatePostDelegate) {
        self.delegate = delegate
    }
    
    func createPost(imagePath: String,
                    text: String) {
        guard let currentUser = UserRepository.shared.currentUserWithIndex.0 else {
            delegate.showError("Current User must be selected!")
            return
        }
        let createdPost = Post(user: currentUser, text: text, image: SSNImage(path: imagePath, source: .local))
        PostRepository.shared.add(createdPost)
        delegate.didCreatePost(createdPost)
    }
}
