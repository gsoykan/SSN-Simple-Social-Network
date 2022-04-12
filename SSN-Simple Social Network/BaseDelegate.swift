//
//  BaseDelegate.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

protocol BaseDelegate: AnyObject {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(_ message: String?)
    func showSuccess(_ message: String?)
}
