//
//  _101_对称二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _101_对称二叉树 {
//    func leftReflectRight(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//        if left == nil && right == nil {
//            return true
//        }
//
//        if left == nil || right == nil {
//            return false
//        }
//
//        if left?.val == right?.val && leftReflectRight(left?.left, right?.right) && leftReflectRight(left?.right, right?.left) {
//            return true
//        }
//
//        return false
//    }
//
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        guard let root = root else {
//            return true
//        }
//
//        return leftReflectRight(root.left, root.right)
//    }
    
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        guard let root = root else {
//            return true
//        }
//
//        var queue: [TreeNode?] = [root]
//        var str: [String] = []
//        while !queue.isEmpty {
//            let levelSize = queue.count
//            if str != str.reversed() {
//                return false
//            }
//
//            str.removeAll()
//            for _ in 0..<levelSize {
//                if let node = queue.removeFirst() {
//                    queue.append(node.left)
//                    if node.left != nil {
//                        str.append("\(node.left!.val)")
//                    } else {
//                        str.append("-")
//                    }
//
//                    queue.append(node.right)
//                    if node.right != nil {
//                        str.append("\(node.right!.val)")
//                    }else {
//                        str.append("-")
//                    }
//                }
//            }
//        }
//        return true
//    }

    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        var queue: [TreeNode] = [root, root]
        
        while !queue.isEmpty {
            let left = queue.removeFirst()
            let right = queue.removeFirst()
            
            if left.val != right.val {
                return false
            }
            
            if left.left != nil && right.right != nil{
                queue.append(left.left!)
                queue.append(right.right!)
            } else if left.left != nil || right.right != nil {
                return false
            }
            
            if left.right != nil && right.left != nil{
                queue.append(left.right!)
                queue.append(right.left!)
            } else if left.right != nil || right.left != nil {
                return false
            }
        }
        return true
    }
}
