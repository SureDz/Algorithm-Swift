//
//  _226_翻转二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/24.
//

import Foundation

class _226_翻转二叉树 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
    
        var queue = [TreeNode?]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
            
            if node?.left != nil {
                queue.append(node?.left)
            }
            
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
        return root
    }
    
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return root
//        }
//
//        let temp = root?.left
//        root?.left = root?.right
//        root?.right = temp
//
//        invertTree(root?.left)
//        invertTree(root?.right)
//
//        return root
//    }
    
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return root
//        }
//
//        invertTree(root?.left)
//
//        let temp = root?.left
//        root?.left = root?.right
//        root?.right = temp
//
//        invertTree(root?.right)
//
//        return root
//    }
    
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return root
//        }
//
//        invertTree(root?.left)
//        invertTree(root?.right)
//
//        let temp = root?.left
//        root?.left = root?.right
//        root?.right = temp
//
//        return root
//    }
}
