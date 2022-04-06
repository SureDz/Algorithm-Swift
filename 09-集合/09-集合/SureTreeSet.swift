//
//  SureTreeSet.swift
//  09-集合
//
//  Created by Sure_Dz on 2022/4/7.
//

import Foundation

class SureTreeSet<T>: SureSet where T: Comparable {
    
    typealias Element = T
    
    private var tree = RBTree<T>()
    
    func size() -> Int {
        return tree.size
    }
    
    func isEmpty() -> Bool {
        size() == 0
    }
    
    func clear() {
        tree.clear()
    }
    
    func add(_ element: T?) {
        guard let element = element else {
            return
        }
        tree.add(element)
    }
    
    func remove(_ element: T?) {
        guard let element = element else {
            return
        }
        tree.remove(element)
    }
    
    func contains(_ element: T?) -> Bool {
        guard let element = element else {
            return false
        }
        return tree.contain(element)
    }
    
    func traversal(visitor: Visitor<T>) {
        tree.inorder(visitor: Visitor(visit: {
            return visitor.visit($0)
        }))
    }
}
