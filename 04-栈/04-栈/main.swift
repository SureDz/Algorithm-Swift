//
//  main.swift
//  04-栈
//
//  Created by Sure_Dz on 2022/2/10.
//

import Foundation

testStack()

func testStack () {
    var stack = SureStack<Int>()
    stack.push(11)
    stack.push(22)
    stack.push(33)
    stack.push(44)
    
    while !stack.isEmpty() {
        print(stack.pop() as Any)
    }
}

