//
//  CircularImage.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

class CircularImage: UIImageView {
    var badgeRatio: CGFloat = 0.5
    private lazy var badgeImageView: CircularImage = {
        let newBadgeImageView: CircularImage = CircularImage(frame: CGRect.zero)
        if superview != nil {
            superview?.addSubview(newBadgeImageView)
            newBadgeImageView.translatesAutoresizingMaskIntoConstraints = false
            newBadgeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            newBadgeImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            newBadgeImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: badgeRatio).isActive = true
            newBadgeImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: badgeRatio).isActive = true
        }
        return newBadgeImageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
