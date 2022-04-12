//
//  BaseViewController.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController,
                          NameDescribable,
                          BaseDelegate {
    func presentNullable(_ viewControllerToPresent: UIViewController?, animated flag: Bool = true, completion: (() -> Void)? = nil) {
        guard let viewController = viewControllerToPresent else {
            assertionFailure()
            return
        }
        present(viewController, animated: flag, completion: completion)
    }
    
    func showError(_ message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
