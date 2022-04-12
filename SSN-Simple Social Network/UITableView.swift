//
//  UITableView.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: NameDescribable & UITableViewCell>(_ cellType: T.Type) {
        let typeName = cellType.typeName
        register(UINib(nibName: typeName, bundle: nil), forCellReuseIdentifier: typeName)
    }
}

