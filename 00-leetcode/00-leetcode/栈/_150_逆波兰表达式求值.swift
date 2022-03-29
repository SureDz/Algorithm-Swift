//
//  _150_逆波兰表达式求值.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/15.
//

import Foundation

class _150_逆波兰表达式求值 {
    func evalRPN(_ tokens: [String]) -> Int {
        enum Symbol: String {
            case plus = "+"
            case minus = "-"
            case multiple = "*"
            case divide = "/"
        }
        var result = [Int]()
        tokens.forEach {
            if let symbol = Symbol(rawValue: $0) {
                let b = result.removeLast()
                let a = result.removeLast()
                switch symbol {
                case .plus:
                    result.append(a + b)
                case .minus:
                    result.append(a - b)
                case .multiple:
                    result.append(a * b)
                case .divide:
                    result.append(a / b)
                }
            } else {
                result.append(Int($0)!)
            }
        }
        return result.removeLast()
    }
}
