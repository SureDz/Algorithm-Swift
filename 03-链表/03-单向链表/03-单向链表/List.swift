//
//  List.swift
//  03-链表
//
//  Created by Sure_Dz on 2022/1/4.
//

import Foundation

protocol SureList {
    
    associatedtype Element
    
    // 元素的数量
    var size: Int { get set}
    
    /**
     *  清除所有的元素
     */
    mutating func clear()

    /**
     * 获取index位置的元素
     * @param index
     * @return
     */
    func getElement(at index: Int) -> Element?
    /**
     * 设置index位置的元素
     * @param index
     * @param element
     * @return 原来的元素ֵ
     */
    @discardableResult
    mutating func setElement(_ element: Element?, at index: Int) -> Element?
    /**
     * 在index位置插入一个元素
     * @param index
     * @param element
     */
    mutating func add(_ element: Element?, at index: Int)
    /**
     * 删除index位置的元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove(index: Int) -> Element?
}

extension SureList {
    /**
     *  元素的数量
     */
    var count: Int {
        size
    }
    /**
     *  是否为空
     *  @return
     */
    var isEmpty: Bool {
        size == 0
    }
    /**
     * 在最后插入一个元素
     * @param index
     * @param element
     */
    mutating func add(_ element: Element?) {
        add(element, at: size)
    }
    
    /**
     *  验证index
     * @param capacity
     */
    func checkIndex(_ index: Int) {
        if index < 0 || index >= size {
            outOfBounds(index: index)
        }
    }
    
    /**
     *  验证index
     * @param capacity
     */
    func checkIndexForAdd(_ index: Int) {
        if index < 0 || index > size {
            outOfBounds(index: index)
        }
    }
    
    /**
     * 抛出异常
     * @param capacity
     */
    func outOfBounds(index: Int) {
        print(type(of: self))
        fatalError("IndexOutOfBoundsException：Index:\(index), size:\(size)")
    }
}
