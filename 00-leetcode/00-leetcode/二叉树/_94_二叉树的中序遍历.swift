//
//  _94_二叉树的中序遍历.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/25.
//

import Foundation

class _94_二叉树的中序遍历 {
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//
//        var list: [Int] = inorderTraversal(root.left)
//        list += [root.val]
//        list += inorderTraversal(root.right)
//        return list
//    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var root = root
        
        var list: [Int] = []
        var stack: [TreeNode?] = []
        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root)
                root = root?.left
            }
            root = stack.removeLast()
            list.append(root!.val)
            root = root?.right
        }
        return list
    }
}
