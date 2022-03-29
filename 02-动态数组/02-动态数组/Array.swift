//
//  02-动态数组.swift
//  AlgorithmWithSwift
//
//  Created by Sure_Dz on 2021/12/27.
//

import Foundation

struct SureArray<T> {
    // 元素的数量
    private var size: Int = 0
    
    // 所有的元素
    private var elements: [T?]
    
    // 初始化默认开辟内存空间
    private let DEFAULT_CAPACITY = 10
    
    // 初始化默认value
    private let DEFAULT_VALUE: T? = nil
    
    // 初始化
    public init(capacity: Int) {
        let newCapacity = capacity < DEFAULT_CAPACITY ? DEFAULT_CAPACITY : capacity
        elements = [T?](repeating: DEFAULT_VALUE, count: newCapacity)
    }
    
    // 无参初始化
    public init() {
        elements = [T?](repeating: DEFAULT_VALUE, count: DEFAULT_CAPACITY)
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

// public
extension SureArray {
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
     *  元素的数量
     *  @return
     */
    var count: Int {
        size
    }
    
    /**
     * 是否为空
     * @return
     */
    var isEmpty: Bool {
        size == 0
    }
    
    /**
     * 获取index位置的元素
     * @param index
     * @return
     */
    func getElement(at index: Int) -> T? {
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
    mutating func setElement(_ element: T?, at index: Int) -> T? {
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
    mutating func add(_ element: T?, at index: Int) {
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
     * 在最后插入一个元素
     * @param index
     * @param element
     */
    mutating func add(_ element: T?) {
        add(element, at: size)
    }
    
    /**
     * 删除index位置的元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove(index: Int) -> T? {
        checkIndex(index)
        let oldElement = elements[index]
        for i in index + 1..<size {
            elements[i - 1] = elements[i]
        }
        size -= 1
        elements[size] = nil
        return oldElement
    }
}
// Equatable
extension SureArray: Equatable where T: Equatable {
    /**
     * 是否包含某个元素
     * @param element
     * @return
     */
    func contains(_ element: T?) -> Bool {
        indexOf(element) != nil
    }
    
    /**
     * 查看元素的索引
     * @param element
     * @return
     */
    func indexOf(_ element: T?) -> Int? {
        for i in 0..<size {
            if elements[i] == element {
                return i
            }
        }
        return nil
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
            var newElements = [T?](repeating: DEFAULT_VALUE, count: newCapacity)
            for i in 0..<size {
                newElements[i] = elements[i]
            }
            elements = newElements
            print("\(oldCapacity)扩容为\(newCapacity)")
            return
        }
    }

    /**
     *  验证index
     * @param capacity
     */
    private func checkIndex(_ index: Int) {
        if index < 0 || index >= size {
            outOfBounds(index: index)
        }
    }
    
    /**
     *  验证index
     * @param capacity
     */
    private func checkIndexForAdd(_ index: Int)  {
        if index < 0 || index > size {
            outOfBounds(index: index)
        }
    }
    
    /**
     * 抛出异常
     * @param capacity
     */
    private func outOfBounds(index: Int) {
        fatalError("数组越界：index=\(index) which size=\(size)")
    }
}
