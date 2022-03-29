//
//  _20_有效的括号.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/2/10.
//

import Foundation

class _20_有效的括号 {
    func isValid(_ s: String) -> Bool {
        if (s.count % 2) == 1 {
            return false
        }
        
        var s = s
        while s.contains("{}") || s.contains("[]") || s.contains("()"){
            s = s.replacingOccurrences(of: "{}", with: "")
            s = s.replacingOccurrences(of: "[]", with: "")
            s = s.replacingOccurrences(of: "()", with: "")
        }
        
        return s.isEmpty
    }
    func isValid1(_ s: String) -> Bool {
        if (s.count % 2) == 1 {
            return false
        }
        
        var arr = [Character]()
        
        for c in s {
            switch c {
            case "[", "(", "{":
                arr.append(c)
            case "]":
                if arr.popLast() != "[" {
                    return false
                }
            case ")":
                if arr.popLast() != "(" {
                    return false
                }
            case "}":
                if arr.popLast() != "{" {
                    return false
                }
            default:
                break
            }
        }
        return arr.isEmpty
    }
    
    func isValid2(_ s: String) -> Bool {
        if (s.count % 2) == 1 {
            return false
        }
        let map: [Character: Character] = ["(":")",
                                           "[":"]",
                                           "{":"}"]
        
        var arr = [Character]()
        for c in s {
            if map.keys.contains(c) {
                arr.append(c)
            } else {
                if arr.isEmpty || map[arr.popLast()!] != c {
                    return false
                }
            }
        }   
        return arr.isEmpty
    }
}
