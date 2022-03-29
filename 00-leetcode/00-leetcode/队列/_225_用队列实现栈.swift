//
//  _225_用队列实现栈.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation

class MyStack {

    private var queue: [Int]
    
    init() {
        queue = [Int]()
    }
    
    func push(_ x: Int) {
        queue.append(x)
        for _ in 1..<queue.count {
            queue.append(queue.removeFirst())
        }
    }
    
    func pop() -> Int {
        queue.removeFirst()
    }
    
    func top() -> Int {
        queue.first!
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}
