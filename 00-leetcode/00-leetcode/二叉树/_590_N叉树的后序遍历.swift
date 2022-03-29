//
//  _590_N叉树的后序遍历.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _590_N叉树的后序遍历 {
//    func postorder(_ root: Node?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//
//        var list: [Int] = []
//        for child in root.children {
//            list += postorder(child)
//        }
//        list += [root.val]
//        return list
//    }
    
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var stack: [Node] = [root]
        var list: [Int] = []
        while let node = stack.popLast() {
            list.append(node.val)
            
            for child in node.children {
                stack.append(child)
            }
        }
        
        return list.reversed()
    }
}
