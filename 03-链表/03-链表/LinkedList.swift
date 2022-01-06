//
//  LinkedList.swift
//  03-链表
//
//  Created by Sure_Dz on 2022/1/4.
//

import Foundation

public class Node<T>: CustomStringConvertible {
    var element: T?
    var next: Node?
    init(element: T?, next: Node? = nil) {
        self.element = element
        self.next = next
    }
    
    public var description: String {
        return (element.map { "\($0)" } ?? "nil") + "_" + (next?.element.map { "\($0)" } ?? "nil")
    }
}

public struct SureLinked<T>: SureList {
    
    typealias Element = T
    
   
    
    var size: Int = 0
    
    var first: Node<T>?
    
    mutating func clear() {
        size = 0
        first = nil
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
        
        var oldNode = first
        if index == 0 {
            first = first?.next
        } else {
            let prev = node(index - 1)
            oldNode = prev?.next
            prev?.next = oldNode?.next
        }
        
        size -= 1
        
        return oldNode?.element
    }
    
    mutating func add(_ element: T?, at index: Int) {
        checkIndexForAdd(index)
        
        if index == 0 {
            first = Node(element: element, next: first)
        } else {
            let prev = node(index - 1)
            prev?.next = Node(element: element, next: prev?.next)
        }
        
        size += 1
    }
}

extension SureLinked {
     func node(_ index: Int) -> Node<T>? {
        checkIndex(index)
        
        var node: Node? = first
        for _ in 0..<index {
            node = node?.next
        }
        return node
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

