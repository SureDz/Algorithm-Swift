//
//  stack.swift
//  04-栈
//
//  Created by Sure_Dz on 2022/2/10.
//

import Foundation

struct SureStack<T> {
    typealias Element = T
    private var list: SureArray<T> = SureArray<T>()
    
    func size() -> Int {
        list.count
    }
    
    func isEmpty() -> Bool {
        list.isEmpty
    }
    
    mutating func push(_ element: Element) {
        list.add(element)
    }
    
    mutating func pop() -> Element? {
        return list.remove(index: list.count - 1)
    }
    
    mutating func top() -> Element? {
        return list.getElement(at:list.count - 1)
    }
}
