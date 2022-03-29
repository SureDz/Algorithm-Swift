//
//  _145_二叉树的后序遍历.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _145_二叉树的后序遍历 {
//   func postorderTraversal(_ root: TreeNode?) -> [Int] {
//       guard let root = root else {
//           return []
//       }
//
//       var list: [Int] = []
//       list += postorderTraversal(root.left)
//       list += postorderTraversal(root.right)
//       list += [root.val]
//
//       return list
//   }
    
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard let root = root else {
//            return []
//        }
//        
//        var stack: [TreeNode] = [root]
//        var list: [Int] = []
//        
//        while let node = stack.popLast() {
//            list.append(node.val)
//            if let left = node.left {
//                stack.append(left)
//            }
//            if let right = node.right {
//                stack.append(right)
//            }
//        }
//        return list.reversed()
//    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var list: [Int] = []
        var stack: [TreeNode?] = []
        var root = root
        var prev: TreeNode? = nil
        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root)
                root = root?.left
            }
            root = stack.removeLast()
            if root?.right == nil || root?.right == prev {
                list.append(root!.val)
                prev = root
                root = nil
            } else {
                stack.append(root)
                root = root?.right
            }
        }
        return list
    }
}
