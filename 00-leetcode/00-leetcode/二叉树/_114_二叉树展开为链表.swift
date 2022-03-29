//
//  _114_二叉树展开为链表.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _114_二叉树展开为链表 {

//    func flatten(_ root: TreeNode?) {
//        var root = root
//        while root != nil {
//            if root?.left == nil {
//                root = root?.right
//            } else {
//                var prev = root?.left
//                while prev?.right != nil {
//                    prev = prev?.right
//                }
//                prev?.right = root?.right
//                root?.right = root?.left
//                root?.left = nil
//                root = root?.right
//            }
//        }
//    }
    
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        var stack: [TreeNode] = [root]
        var prev: TreeNode? = nil
        while let node = stack.popLast() {
            prev?.right = node
            prev?.left = nil
            
            if node.right != nil {
                stack.append(node.right!)
            }
            
            if node.left != nil {
                stack.append(node.left!)
            }
            
            prev = node
        }
    }
}
