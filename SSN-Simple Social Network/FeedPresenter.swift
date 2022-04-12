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
    
    func loadPosts() {
        delegate.posts = PostRepository.shared.getInfo()
    }
}
