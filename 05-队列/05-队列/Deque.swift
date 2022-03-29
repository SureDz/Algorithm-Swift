//
//  Deque.swift
//  05-队列
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation

struct SureDeque<T> {
    
    typealias Element = T
    
    private var list: SureLinked<T> = SureLinked<T>()
    
    func size() -> Int {
        return list.size
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    mutating func enQueueRear(_ element: Element) {
        list.add(element)
    }
    
    mutating func deQueueFront() -> Element? {
        return list.remove(index: 0)
    }
    
    mutating func enQueueFront(_ element: Element) {
        list.add(element, at: 0)
    }
    
    mutating func deQueueRear() -> Element? {
        return list.remove(index: list.size - 1)
    }
    
    func front() -> Element? {
        return list.getElement(at:0)
    }
    
    func rear() -> Element? {
        return list.getElement(at:list.size - 1)
    }
    
    mutating func clear() {
        list.clear()
    }
}
