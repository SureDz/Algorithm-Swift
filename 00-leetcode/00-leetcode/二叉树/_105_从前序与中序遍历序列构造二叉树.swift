//
//  _105_从前序与中序遍历序列构造二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _105_从前序与中序遍历序列构造二叉树 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        
        let rootNode = TreeNode(preorder.first!)
        for (index, num) in inorder.enumerated() {
            if num == rootNode.val {
                rootNode.left = buildTree(Array(preorder[1 ..< index + 1]), Array(inorder[0 ..< index]))
                rootNode.right = buildTree(Array(preorder[index + 1 ..< preorder.endIndex]), Array(inorder[index + 1 ..< inorder.endIndex]))
            }
        }
        return rootNode
    }
}
