//
//  _224_基本计算器.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/15.
//

import Foundation

class _224_基本计算器 {
    func calculate(_ s: String) -> Int {
        let sArr = Array(s)
        var sign = 1
        var signArray = [1]
        var result = 0
        var i = 0
        
        while i < sArr.count {
            let c = sArr[i]
            
            if c == " " {
                i += 1
                continue
            }
            
            switch c {
            case Character("+"):
                sign = signArray.last!
            case Character("-"):
                sign = -signArray.last!
            case Character("("):
                signArray.append(sign)
            case Character(")"):
                signArray.removeLast()
            default:
                var num = 0
                while i < sArr.count && sArr[i].asciiValue! >= Character("0").asciiValue! && sArr[i].asciiValue! <= Character("9").asciiValue! {
                    num = num * 10 + Int(sArr[i].asciiValue! - Character("0").asciiValue!)
                    i += 1
                }
                result += (num * sign)
                continue
            }
            i += 1
        }
        return result
    }
}
