//
//  SureListSet.swift
//  09-集合
//
//  Created by Sure_Dz on 2022/4/7.
//

import Foundation

class SureListSet<T>: SureSet where T: Comparable {
    
    typealias Element = T
    
    private var list = SureLinked<T>()
    
    func size() -> Int {
        return list.size
    }
    
    func isEmpty() -> Bool {
        size() == 0
    }
    
    func clear() {
        list.clear()
    }
    
    func add(_ element: T?) {
        if element == nil {
            return
        }
        if let index = list.indexOf(element) {
            list.setElement(element, at: index)
        } else {
            list.add(element)
        }
    }
    
    func remove(_ element: T?) {
        if element == nil {
            return
        }
        if let index = list.indexOf(element) {
            list.remove(index: index)
        } 
    }
    
    func contains(_ element: T?) -> Bool {
        guard let element = element else {
            return false
        }
        return list.contains(element)
    }
    
    func traversal(visitor: Visitor<T>) {
        let size = list.size
        for i in 0 ..< size {
            if visitor.visit(list.getElement(at: i)!) {
                return
            }
        }
    }
}
