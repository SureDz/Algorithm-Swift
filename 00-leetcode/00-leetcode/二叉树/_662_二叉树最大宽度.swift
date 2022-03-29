//
//  _662_二叉树最大宽度.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _662_二叉树最大宽度 {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var queue: [(TreeNode, Int)] = [(root, 0)]
      
        var left = 0
        var size = 1
        while !queue.isEmpty {
            let levelSize = queue.count
            var initial = false
            for _ in 0..<levelSize {
                var (node, pos) = queue.removeFirst()
                if !initial {
                    initial = true
                    left = pos
                }
              
                pos -= left
                size = max(size, pos + 1)
            
                
                if node.left != nil {
                    queue.append((node.left!, pos * 2))
                }
                
                if node.right != nil {
                    queue.append((node.right!, pos * 2 + 1))
                }
                
            }
        }
        return size
    }
}
