//
//  Map.swift
//  10-映射
//
//  Created by Sure_Dz on 2022/4/9.
//

import Foundation

public class Visitor<K, V> {
    
    var stop: Bool = false
    var visit: (K, V) -> Bool
    
    init(visit: @escaping (K, V) -> Bool) {
        self.visit = visit
    }
    
}

protocol Map {
    
    associatedtype K
    
    associatedtype V
    
    func count() -> Int
    
    func clear()
    
    func put(_ key: K, _ value: V) -> V?
    
    func get(_ key: K) -> V?
    
    func remove(_ key: K) -> V?
    
    func containsKey(_ key: K) -> Bool
    
    func containsValue(_ value: V) -> Bool
    
    func traversal(visit: Visitor<K, V>)
}

extension Map {
    func isEmpty() -> Bool {
        count() == 0
    }
}
