//
//  PostTableViewCell.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell, NameDescribable {
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var headerView: PostHeaderView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with post: Post) {
        contentLabel.text = post.text
        try? post.image.loadImage(completion: { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(img):
                strongSelf.postImageView.image = img ?? Constants.Assets.placeHolderImage
            case let .failure(error):
                debugPrint(error)
                strongSelf.postImageView.image = Constants.Assets.placeHolderImage
            }
        })
        headerView.configure(with: post.user)
    }
    
    func reset() {
        contentLabel.text = nil
        postImageView.image = Constants.Assets.placeHolderImage
    }
}
