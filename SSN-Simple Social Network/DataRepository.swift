//
//  DataRepository.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import Foundation

protocol DataRepository: AnyObject  {
    associatedtype T: Codable
    
    var userDefaults: UserDefaults { get set }
    // TODO: @gsoykan this can be a set, and User can be comparable if we'd like to enfore uniqueness.
    var elements: [T]? { get set }
    var key: String { get }
    
    func add(_ element: T)
    func storeInfo(data: [T])
    func getInfo() -> [T]?
}

extension DataRepository  {
    func getInfo() -> [T]?  {
        guard let savedData = userDefaults.object(forKey: self.key) as? Data else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode([T].self, from: savedData) else {
            return nil
        }
        return loadedData
    }
    
    func storeInfo(data: [T]) {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(data) else {
            return
        }
        userDefaults.set(encoded, forKey: self.key)
        elements = data
    }
    
    func add(_ user: T) {
        var arr = self.elements ?? []
        arr.append(user)
        storeInfo(data: arr)
    }
}
