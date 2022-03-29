//
//  _104_二叉树的最大深度.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _104_二叉树的最大深度 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//
//        var height = 0
//        var queue: [TreeNode] = [root]
//        var levelSize = 1
//        while !queue.isEmpty {
//            let node = queue.removeFirst()
//            levelSize -= 1
//
//            if node.left != nil {
//                queue.append(node.left!)
//            }
//            if node.right != nil {
//                queue.append(node.right!)
//            }
//
//            if levelSize == 0 {
//                height += 1
//                levelSize = queue.count
//            }
//        }
//        return height
//    }
}
