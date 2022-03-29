//
//  _856_括号的分数.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/11.
//

import Foundation

class _856_括号的分数 {
    func scoreOfParentheses(_ s: String) -> Int {
        var deep = 0
        var result = 0
        var last: Character? = nil
        for c in s {
            if c == "(" {
                deep += 1
            } else {
                deep -= 1
                if last == "(" {
                    result += (1 << deep)
                }
            }
            last = c
        }
        return result
    }
}
