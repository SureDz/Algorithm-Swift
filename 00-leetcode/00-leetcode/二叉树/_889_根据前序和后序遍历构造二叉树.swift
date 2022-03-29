//
//  _889_根据前序和后序遍历构造二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _889_根据前序和后序遍历构造二叉树 {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        if preorder.count == 0 || postorder.count == 0 {
            return nil
        }

        let rootNode = TreeNode(preorder.first!)
        if preorder.count == 1 || postorder.count == 1 {
            return rootNode
        }
        
        var L = 0
        for (index, num) in postorder.enumerated() {
            if num == preorder[1] {
               L = index + 1
            }
        }
        rootNode.left = constructFromPrePost(Array(preorder[1 ..< L + 1]), Array(postorder[0 ..< L]))
        rootNode.right = constructFromPrePost(Array(preorder[L + 1 ..< preorder.endIndex]), Array(postorder[L ..< postorder.endIndex - 1]))
        return rootNode
    }
}
