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

public struct SureLinked<T>: SureList {
    
    typealias Element = T
    
    var size: Int = 0
    
    var first: Node<T>?
    
    var last: Node<T>?
    
    mutating func clear() {
        size = 0
        first = nil
        last = nil
    }
    
    func getElement(at index: Int) -> T? {
        node(index)?.element
    }
    
    mutating func setElement(_ element: T?, at index: Int) -> T? {
        let node = node(index)
        let oldE = node?.element
        node?.element = element
        return oldE
    }
    
    mutating func remove(index: Int) -> T? {
        checkIndex(index)
        
        let node = node(index)
        let prev = node?.prev
        let next = node?.next
        
        if prev == nil {
            first = next
        } else {
            prev?.next = next
        }
        
        if next == nil {
            last = prev
        } else {
            next?.prev = prev
        }
        
        size -= 1
        
        return node?.element
    }
    
    mutating func add(_ element: T?, at index: Int) {
        checkIndexForAdd(index)
        
        if index == size {
            let oldLast = last
            last = Node(prev: oldLast, element: element, next: nil)
            if oldLast == nil {
                first = last
            } else {
                oldLast?.next = last
            }
        } else {
            let next = node(index)
            let prev = next?.prev
            let current = Node(prev: prev, element: element, next: next)
            next?.prev = current
            if prev == nil {
                first = current
            } else {
                prev?.next = current
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

