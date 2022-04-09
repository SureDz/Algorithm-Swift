//
//  TreeSet.swift
//  10-映射
//
//  Created by Sure_Dz on 2022/4/10.
//

import Foundation

class TreeSet<E: Comparable>: Set {
    
    private var map = TreeMap<E, Int>()
    
    func count() -> Int {
        return map.count()
    }
    
    func clear() {
        map.clear()
    }
    
    func add(_ element: E) {
        map.put(element, 0)
    }
    
    func remove(_ element: E) {
        map.remove(element)
    }
    
    func contains(_ element: E) -> Bool {
        return map.containsKey(element)
    }
    
    func traversal(visit: SetVisitor<E>) {
        map.traversal(visit: Visitor(visit: {
            (key, value) in
            return visit.visit(key)
        }))
    }
}


// description
extension TreeSet: CustomStringConvertible {

    public var description: String {
        return map.description
    }

}
