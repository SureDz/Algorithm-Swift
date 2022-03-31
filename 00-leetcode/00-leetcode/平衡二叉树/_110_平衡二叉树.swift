//
//  _110_平衡二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/31.
//

import Foundation

class _110_平衡二叉树  {
    
    func height(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return max(height(root.left), height(root.right)) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return abs(height(root.left) - height(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
}
