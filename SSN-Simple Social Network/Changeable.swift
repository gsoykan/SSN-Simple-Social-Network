//
//  Changeable.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

protocol Changeable {}

// source: https://stackoverflow.com/a/66623586/8265079
extension Changeable {
    func change<T>(path: WritableKeyPath<Self, T>, to value: T) -> Self {
        var clone = self
        clone[keyPath: path] = value
        return clone
    }
}
