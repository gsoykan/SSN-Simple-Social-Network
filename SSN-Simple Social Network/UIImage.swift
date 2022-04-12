//
//  UIImag.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

extension UIImage {
    func saveLocally() -> URL? {
        do {
            let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(),
                                            isDirectory: true)
            let temporaryFilename = ProcessInfo().globallyUniqueString
            let temporaryFileURL =
                temporaryDirectoryURL.appendingPathComponent(temporaryFilename)
            guard let data: Data = self.pngData() else {
                return nil
            }
            try data.write(to: temporaryFileURL,
                           options: .atomic)
            return temporaryFileURL
        } catch  {
            return nil
        }
    }
}


extension UIImage {
    convenience init?(withContentsOfUrl url: URL, scale: CGFloat = 1.0) {
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data, scale: scale)
        } catch {
            debugPrint("-- Error: \(error)")
            return nil
        }
    }
}
