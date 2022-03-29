//
//  Queue.swift
//  05-队列
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation

struct SureQueue<T> {
    
    typealias Element = T
    
    private var list: SureLinked<T> = SureLinked<T>()
    
    func size() -> Int {
        return list.size
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    mutating func enQueue(_ element: Element) {
        list.add(element)
    }
    
    mutating func deQueue() -> Element? {
        return list.remove(index: 0)
    }
    
    func front() -> Element? {
        return list.getElement(at:0)
    }
    
    mutating func clear() {
        list.clear()
    }
}
