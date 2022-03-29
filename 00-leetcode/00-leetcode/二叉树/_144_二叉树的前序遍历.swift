//
//  _144_二叉树的前序遍历.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/24.
//

import Foundation

class _144_二叉树的前序遍历 {
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        var list = [Int]()
//        if root == nil {
//            return list
//        }
//
//        list.append(root!.val)
//        list += preorderTraversal(root?.left)
//        list += preorderTraversal(root?.right)
//        return list
//    }
    
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//
//        var list = [Int]()
//        var stack: [TreeNode] = [root]
//        while let node = stack.popLast() {
//            list.append(node.val)
//            if let right = node.right {
//                stack.append(right)
//            }
//            if let left = node.left {
//                stack.append(left)
//            }
//        }
//
//        return list
//    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var root = root
        
        var list: [Int] = []
        var stack: [TreeNode?] = []
        while root != nil || !stack.isEmpty {
            while root != nil {
                list.append(root!.val)
                stack.append(root)
                root = root?.left
            }
            root = stack.removeLast()
            root = root?.right
        }
        return list
    }
    
//    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard var root = root else {
//            return []
//        }
//
//
//        var stack: [TreeNode] = [root]
//        var list: [Int] = [root.val]
//
//        while !stack.isEmpty {
//            while let left = root.left {
//                root = left
//                stack.append(root)
//                list.append(root.val)
//            }
//
//            while root.right == nil {
//                stack.removeLast()
//                if let last = stack.last {
//                    root = last
//                } else {
//                    return list
//                }
//            }
//
//            root = root.right!
//            stack.removeLast()
//            stack.append(root)
//            list.append(root.val)
//
//        }
//        return list
//    }
}
