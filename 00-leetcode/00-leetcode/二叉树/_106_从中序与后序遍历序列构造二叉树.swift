//
//  _106_从中序与后序遍历序列构造二叉树.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _106_从中序与后序遍历序列构造二叉树 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 || postorder.count == 0 {
            return nil
        }
        
        let rootNode = TreeNode(postorder.last!)
        
        for (index, num) in inorder.enumerated() {
            if num == rootNode.val {
                rootNode.left = buildTree(Array(inorder[0..<index]), Array(postorder[0..<index]))
                rootNode.right = buildTree(Array(inorder[index + 1 ..< inorder.endIndex]), Array(postorder[index ..< postorder.endIndex - 1]))
            }
        }
        return rootNode
    }
}
