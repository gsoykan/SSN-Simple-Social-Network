//
//  PostHeaderView.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit

@IBDesignable
class PostHeaderView: BaseView {
    @IBOutlet weak var profileImage: CircularImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func postInit() {
        super.postInit()
    }
    
    func configure(with user: User) {
        try? user.profileImage.loadImage(completion: { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(img):
                strongSelf.profileImage.image = img ?? Constants.Assets.profilePlaceHolderImage
            case let .failure(error):
                debugPrint(error)
                strongSelf.profileImage.image = Constants.Assets.profilePlaceHolderImage
            }
        })
        nameLabel.text = user.name
        usernameLabel.text = "@\(user.username)"
    }
}
