//
//  01-复杂度.swift
//  AlgorithmWithSwift
//
//  Created by Sure_Dz on 2021/12/25.
//

import Foundation

/**
 0 1 1 2 3 5 8 13 21 34
 */

// O(1)
func fib(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fib(n - 1) + fib(n - 2)
}

// O(2^n)
func fib1(_ n: Int) -> Int {
    if n <= 1 { return n }
    
    var first: Int = 0
    var second: Int = 1
    for _ in 2...n {  // 注意循环次数
        let sum = first + second
        first = second
        second = sum
    }
    return second
}

func fib2(_ n: Int) -> Int {
    if n <= 1 { return n }
    
    var state = (0, 1)
    for _ in 2...n {
        state = (state.1, state.0 + state.1) // 元组
    }
    return state.1
}

// 矩阵快速幂
/**
    [1 1]   1 1    1
    [1 0]   1 0    0
 */
func fib3(_ n: Int) -> Int {
    if n <= 1 { return n }
    var mi = [(1, 1), (1, 0)]
    for _ in 1..<n {
        mi  = [(mi[0].0 + mi[0].1, mi[0].0), (mi[1].0 + mi[1].1, mi[1].0)]
    }
    return mi[1].0
}

// 通项公式
func fib4(_ n: Int) -> Int {
    if n <= 1 { return n }
    let sqrt5 = sqrt(5)
    return Int(1 / sqrt5 * Double((pow(( 1 + sqrt5 ) / 2, Double(n)) + pow((1 - sqrt5) / 2, Double(n)))))
}
