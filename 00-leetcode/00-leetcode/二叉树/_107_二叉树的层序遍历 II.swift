//
//  _107_二叉树的层序遍历 II.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _107_二叉树的层序遍历  {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var list: [[Int]] = []
        var levelList: [Int] = []
        var queue: [TreeNode] = [root]
        var levelSize = 1
        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelList.append(node.val)
            levelSize -= 1
            
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }
            
            if levelSize == 0 {
                levelSize = queue.count
                list.insert(levelList, at: 0)
                levelList.removeAll()
            }
        }
        return list
    }
}
