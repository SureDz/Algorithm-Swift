//
//  ArrayList.swift
//  03-链表
//
//  Created by Sure_Dz on 2022/1/5.
//

import Foundation

struct SureArray<T>: SureList {
    typealias Element = T
    // 元素的数量
    var size: Int = 0;
    // 所有的元素
    private var elements: [Element?]
    // 初始化默认开辟内存空间
    private let DEFAULT_CAPACITY = 10

    // 初始化默认value
    private let DEFAULT_VALUE: Element? = nil

    // 初始化
    public init(capacity: Int) {
        let newCapacity = capacity < DEFAULT_CAPACITY ? DEFAULT_CAPACITY : capacity
        elements = [Element?](repeating: DEFAULT_VALUE, count: newCapacity)
    }

    // 无参初始化
    public init() {
        elements = [Element?](repeating: DEFAULT_VALUE, count: DEFAULT_CAPACITY)
    }
    
    /**
     *  清除所有元素
     */
    mutating func clear() {
        for i in 0..<size {
            elements[i] = nil
        }
        size = 0
    }

    /**
     * 获取index位置的元素
     * @param index
     * @return
     */
    func getElement(at index: Int) -> Element? {
        checkIndex(index)
        return elements[index]
    }

    /**
     * 设置index位置的元素
     * @param index
     * @param element
     * @return 原来的元素ֵ
     */
    @discardableResult
    mutating func setElement(_ element: Element?, at index: Int) -> Element? {
        checkIndex(index)
        let oldElement = elements[index]
        elements[index] = element
        return oldElement
    }

    /**
     * 在index位置插入一个元素
     * @param index
     * @param element
     */
    mutating func add(_ element: Element?, at index: Int) {
        checkIndexForAdd(index)
        ensureCapacity(size + 1)
        var i = size
        while i > index {
            elements[i] = elements[i - 1]
            i -= 1
        }
        elements[index] = element
        size += 1
    }

    /**
     * 删除index位置的元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove(index: Int) -> Element? {
        checkIndex(index)
        let oldElement = elements[index]
        for i in (index + 1)..<size {
            elements[i - 1] = elements[i]
        }
        size -= 1
        elements[size] = nil
        
        trim()
        return oldElement
    }
}

extension SureArray: Equatable where T: Equatable {
    /**
     * 查看元素的索引
     * @param element
     * @return
     */
    func indexOf(_ element: Element?) -> Int? {
        for i in 0..<size {
            if elements[i] == element {
                return i
            }
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
extension SureArray: CustomStringConvertible {

    public var description: String {
        var des = "size = \(size), elements = ["
        for i in 0..<size {
            if i != 0 {
                des += ", "
            }
            des += elements[i].map{ "\($0)" } ?? "nil"
        }
        des += "]"
        return des
    }
}

// private
extension SureArray {
    /**
     * 保证要有capacity的容量
     * @param capacity
     */
    private mutating func ensureCapacity(_ capacity: Int) {
        let oldCapacity = elements.count
        guard oldCapacity >= capacity else {
            let newCapacity = oldCapacity + oldCapacity >> 1
            var newElements = [Element?](repeating: DEFAULT_VALUE, count: newCapacity)
            for i in 0..<size {
                newElements[i] = elements[i]
            }
            elements = newElements
            print("\(oldCapacity)扩容为\(newCapacity)")
            return
        }
    }
    
    private mutating func trim() {
        let oldCapacity = elements.count
        let newCapacity = oldCapacity >> 1
        guard size >= newCapacity || oldCapacity <= DEFAULT_CAPACITY else {
            var newElements = [Element?](repeating: DEFAULT_VALUE, count: newCapacity)
            for i in 0..<size {
                newElements[i] = elements[i]
            }
            elements = newElements
            print("\(oldCapacity)缩容为\(newCapacity)")
            return
        }
    }
}
