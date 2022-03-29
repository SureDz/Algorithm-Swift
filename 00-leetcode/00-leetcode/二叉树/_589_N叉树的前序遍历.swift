//
//  _589_N叉树的前序遍历.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _589_N叉树的前序遍历 {
//    func preorder(_ root: Node?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//
//        var list: [Int] = []
//        var stack: [Node] = [root]
//        while let node = stack.popLast() {
//            list.append(node.val)
//
//            for child in node.children.reversed() {
//                stack.append(child)
//            }
//        }
//
//        return list
//    }
    
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }

        var list: [Int] = []
        list += [root.val]
        for child in root.children {
            list += preorder(child)
        }
        return list
    }
}
