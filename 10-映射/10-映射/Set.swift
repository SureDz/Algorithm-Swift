//
//  Set.swift
//  10-映射
//
//  Created by Sure_Dz on 2022/4/10.
//

import Foundation

public class SetVisitor<E> {
    
    var stop: Bool = false
    var visit: (E) -> Bool
    
    init(visit: @escaping (E) -> Bool) {
        self.visit = visit
    }
    
}

protocol Set {
    
    associatedtype E
    
    func count() -> Int
    
    func clear()
    
    func add(_ element: E)
    
    func remove(_ element: E)
    
    func contains(_ element: E) -> Bool
    
    func traversal(visit: SetVisitor<E>)
}

extension Set {
    func isEmpty() -> Bool {
        count() == 0
    }
}
