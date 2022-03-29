//
//  _232_用栈实现队列.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation

class MyQueue {
    
    private var inStack: [Int]
    private var outStack: [Int]
    
    init() {
        inStack = [Int]()
        outStack = [Int]()
    }

    func push(_ x: Int) {
        inStack.append(x)
    }

    func pop() -> Int {
       checkOutStack()
        
        return outStack.popLast()!
    }

    func peek() -> Int {
        checkOutStack()
        
        return outStack.last!
    }

    func empty() -> Bool {
        inStack.isEmpty && outStack.isEmpty
    }
    
    func checkOutStack() {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.popLast()!)
            }
        }
    }
}
