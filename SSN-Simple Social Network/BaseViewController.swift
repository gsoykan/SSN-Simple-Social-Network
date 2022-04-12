//
//  BaseViewController.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit
import SVProgressHUD

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
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showError(_ message: String? = nil) {
        DispatchQueue.main.async {
            SVProgressHUD.showError(withStatus: message)
        }
    }
    
    func showSuccess(_ message: String? = nil) {
        DispatchQueue.main.async {
            SVProgressHUD.showSuccess(withStatus: message)
        }
    }
}
