//
//  UIStoryboard.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    static let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func instantiate<T: NameDescribable & UIViewController>(_ viewController: T.Type) -> T? {
        instantiateViewController(withIdentifier: viewController.typeName) as? T
    }
}
