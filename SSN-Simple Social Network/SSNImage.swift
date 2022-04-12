//
//  SSNImage.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation
import UIKit

struct SSNImage: Codable {
    enum Source: String, Codable {
        case asset
        case network
        case local
    }
    
    let path: String
    let source: Source
    
    func loadImage(completion: @escaping (Result<UIImage?, Error>) -> Void ) throws {
        switch source {
        case .asset:
            completion(Result.success(UIImage(named: path)))
        case .local:
            guard let url = URL(string: path) else {
                completion(Result.failure(SSNError.InvalidImagePathError(path: path)))
                return
            }
            completion(Result.success(UIImage(withContentsOfUrl: url)))
        case .network:
            throw SSNError.UnimplementedSSNImageSource(source: source.rawValue)
        }
    }
}
