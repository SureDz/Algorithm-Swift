//
//  LinkedList.swift
//  03-链表
//
//  Created by Sure_Dz on 2022/1/4.
//

import Foundation

public class Node<T>: CustomStringConvertible {
    var element: T?
    var prev: Node?
    var next: Node?
    init(prev: Node? = nil, element: T?, next: Node? = nil) {
        self.element = element
        self.prev = prev
        self.next = next
    }
    
    public var description: String {
        let pStr = prev?.element.map { "\($0)" } ?? "nil"
        let eStr = element.map { "\($0)" } ?? "nil"
        let nStr = next?.element.map { "\($0)" } ?? "nil"
        return pStr + "_" + eStr + "_" + nStr
    }
}

// ==
extension Node: Equatable where T: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element == rhs.element
    }
}

public struct SureLinked<T>: SureList where T: Equatable {
    
    typealias Element = T
    
    var size: Int = 0
    
    var first: Node<T>?
    
    var last: Node<T>?
    
    var current: Node<T>?
    
    mutating func reset() {
        current = first
    }
    
    @discardableResult
    mutating func next() -> T? {
        if current == nil {
            return nil
        }
        current = current?.next
        return current?.element
    }
    
    mutating func remove () -> T? {
        if current == nil {
            return nil
        }
        let next = current?.next
        let element = remove(current)
        
        if size == 0 {
            current = nil
        } else {
            current = next
        }
        return element
    }
    
    mutating func clear() {
        size = 0
        first = nil
        last = nil
    }
    
    func getElement(at index: Int) -> T? {
        node(index)?.element
    }
    
    @discardableResult
    mutating func setElement(_ element: T?, at index: Int) -> T? {
        let node = node(index)
        let oldE = node?.element
        node?.element = element
        return oldE
    }
    
    mutating func remove(_ node: Node<T>?) -> T? {
        
        if size == 1 {
            first = nil
            last = nil
        } else {
            let prev = node?.prev
            let next = node?.next
            prev?.next = next
            next?.prev = prev
            
            if node == first {
                first = next
            } else {
                prev?.next = next
            }
            
            if next == nil {
                last = prev
            } else {
                next?.prev = prev
            }
        }
      
        
        size -= 1
        
        return node?.element
    }
    
    @discardableResult
    mutating func remove(index: Int) -> T? {
        checkIndex(index)
    
        return remove(node(index))
    }
    
    mutating func add(_ element: T?, at index: Int) {
        checkIndexForAdd(index)
        
        if index == size {
            let oldLast = last
            last = Node(prev: oldLast, element: element, next: first)
            if oldLast == nil {
                first = last
                first?.next = first
                first?.prev = first
            } else {
                oldLast?.next = last
                first?.prev = last
            }
        } else {
            let next = node(index)
            let prev = next?.prev
            let current = Node(prev: prev, element: element, next: next)
            next?.prev = current
            prev?.next = current
            
            if next == first {
                first = current
            }
        }
        
        size += 1
    }
}

extension SureLinked {
     func node(_ index: Int) -> Node<T>? {
        checkIndex(index)
        
        if index < (size >> 1) {
            var node: Node? = first
            for _ in 0..<index {
                node = node?.next
            }
            return node
        } else {
            var node: Node? = last
            for _ in index..<size - 1 {
                node = node?.prev
            }
            return node
        }
    }
}

extension SureLinked where T: Equatable {
    /**
     * 查看元素的索引
     * @param element
     * @return
     */
    func indexOf(_ element: Element?) -> Int? {
        var node = first
        for i in 0..<size {
            if node?.element == element {
                return i
            }
            node = node?.next
        }
        return nil
    }
    /**
     *  是否包含某元素
     */
    func contains(_ element: Element) -> Bool {
        indexOf(element) != nil
    }
}

// print des
extension SureLinked: CustomStringConvertible {

    public var description: String {
        var des = "size = \(size), ["
        var node = first
        for i in 0..<size {
            if i != 0 {
                des += ", "
            }
            des += node.map{ "\($0)" } ?? "nil"
            node = node?.next
        }
        des += "]"
        return des
    }
}

