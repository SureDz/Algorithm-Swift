//
//  CircleDeque.swift
//  05-队列
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation

struct SureCircleDeque<T> {
    
    typealias Element = T
    
    private var front: Int = 0
    private var size: Int = 0
    private var elements: [T?]
    private let DEFAULT_CAPACITY = 10
    private let DEFAULT_VALUE: T? = nil
    
    public init() {
        elements = [T?](repeating: DEFAULT_VALUE, count: DEFAULT_CAPACITY)
    }
    
    func count() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    mutating func clear() {
        for i in 0..<size {
            elements[index(i)] = nil
        }
        front = 0
        size = 0
    }
    
    mutating func enQueueRear(_ element: Element) {
        ensureCapacity(size + 1)
        
        elements[index(size)] = element
        size += 1
    }
    
    @discardableResult
    mutating func deQueueFront() -> Element? {
        let frontE = elements[front]
        elements[front] = nil
        front = index(1)
        size -= 1
        return frontE
    }
    
    mutating func enQueueFront(_ element: Element) {
        ensureCapacity(size + 1)
        
        front = index(-1)
        elements[front] = element
        size += 1
    }
    
    @discardableResult
    mutating func deQueueRear() -> Element? {
        let rearIndex = index(size - 1)
        let rear = elements[rearIndex]
        elements[rearIndex] = nil 
        size -= 1
        return rear
    }
    
    func frontElement() -> Element? {
        return elements[front]
    }
    
    func rearElement() -> Element? {
        return elements[index(size - 1)]
    }
}

extension SureCircleDeque: CustomStringConvertible {
    public var description: String {
        var des = "size = \(size), front = \(front), elements = ["
        for i in 0..<elements.count {
            if i != 0 {
                des += ", "
            }
            des += elements[i].map{ "\($0)" } ?? "nil"
        }
        des += "]"
        return des
    }
}

extension SureCircleDeque {
    /**
     * 保证要有capacity的容量
     * @param capacity
     */
    private mutating func ensureCapacity(_ capacity: Int) {
        let oldCapacity = elements.count
        guard oldCapacity >= capacity else {
            let newCapacity = oldCapacity + oldCapacity >> 1
            var newElements = [T?](repeating: DEFAULT_VALUE, count: newCapacity)
        
            for i in 0..<size {
                newElements[i] = elements[index(i)]
            }
            elements = newElements
            front = 0
            print("\(oldCapacity)扩容为\(newCapacity)")
            return
        }
    }
    
    func index(_ index: Int) -> Int {
        var indexC = index
        indexC += front
        if indexC < 0 {
            return indexC + elements.count
        }
        return indexC - (indexC >= elements.count ? elements.count : 0)
    }
}
