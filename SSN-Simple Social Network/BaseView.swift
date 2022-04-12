//
//  BaseView.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

@IBDesignable
class BaseView: UIView {
    @IBOutlet weak var contentView: UIView!
    
    var nibName: String {
        var name = NSStringFromClass(type(of: self))
        let nameParts = name.split(separator: ".")
        name = String(nameParts.last!)
        return name
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        postInit()
    }
    
    func postInit() {
        
    }
}
