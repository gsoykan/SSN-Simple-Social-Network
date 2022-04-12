//
//  UIImag.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        self.init(data: imageData)
    }
}
