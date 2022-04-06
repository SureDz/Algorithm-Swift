//
//  BinaryTree.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/29.
//

import Foundation

public class BinaryTree<T> where T: Comparable {
    
    var size: Int
    
    var root: TreeNode<T>?
    
    init() {
        self.root = nil
        self.size = 0
    }
    
    var count: Int {
        size
    }
    
    func clear() {
        root = nil
        size = 0
    }
    
    func isEmpty() -> Bool {
        size == 0
    }
    
}

// 打印
extension BinaryTree: CustomStringConvertible {

    func nodeBlank(_ count: Int) -> String {
        var blank = ""
        var count = count
        while count > 0 {
            count -= 1
            blank += " "
        }
        return blank
    }
    
    func toString(node: TreeNode<T>?, nodePrefix: String, leftPrefix: String, rightPrefix: String) -> String {
        guard let node = node else {
            return ""
        }

        let left = node.left
        let right = node.right
        let str = node.description
        
        var length = str.count
        if (length % 2 == 0) {
            length -= 1
        }
        
        length >>= 1
        
        var result: String = ""
        if right != nil {
            let rightPrefix = rightPrefix + nodeBlank(length)
            result += toString(node: node.right, nodePrefix: rightPrefix + "┌──", leftPrefix: rightPrefix + "│  ", rightPrefix: rightPrefix + "   ")
        }
       
        result += nodePrefix + str + "\n"
        
        if left != nil {
            let leftPrefix = leftPrefix + nodeBlank(length)
            result += toString(node: node.left, nodePrefix: leftPrefix + "└──", leftPrefix: leftPrefix + "   ", rightPrefix: leftPrefix + "│  ")
        }

        return result
    }
    
    public var description: String {
        toString(node: root, nodePrefix: "", leftPrefix: "", rightPrefix: "")
    }

}

public class Visitor<T> {
    
    var stop: Bool = false
    var visit: (T) -> Bool
    
    init(visit: @escaping (T) -> Bool) {
        self.visit = visit
    }
    
}

// 遍历
extension BinaryTree {
    // 前序遍历
    func preorder(visitor: Visitor<T>) {
       preorder(root, visitor)
    }
    
    private func preorder(_ node: TreeNode<T>?, _ visitor: Visitor<T>) {
        if node == nil || visitor.stop {
            return
        }
        
        visitor.stop = visitor.visit(node!.element)
        preorder(node?.left, visitor)
        preorder(node?.right, visitor)
    }
    
    // 中序遍历
    func inorder(visitor: Visitor<T>) {
        inorder(root, visitor)
    }
    
    private func inorder(_ node: TreeNode<T>?, _ visitor: Visitor<T>) {
        if node == nil || visitor.stop {
            return
        }
        
        inorder(node?.left, visitor)
        if visitor.stop {
            return
        }
        visitor.stop = visitor.visit(node!.element)
        inorder(node?.right, visitor)
    }
    
    // 后序遍历
    func postorder(visitor: Visitor<T>) {
        postorder(root, visitor)
    }
    
    private func postorder(_ node: TreeNode<T>?, _ visitor: Visitor<T>) {
        if node == nil || visitor.stop {
            return
        }
        
        postorder(node?.left, visitor)
        postorder(node?.right, visitor)
        if visitor.stop {
            return
        }
        visitor.stop = visitor.visit(node!.element)
    }
    
    // 层序遍历
    func levelorder(visitor: Visitor<T>) {
        guard let root = root else {
            return
        }
        
        var queue: [TreeNode<T>] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
           
            if visitor.visit(node.element) {
                return
            }
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    
    // 计算高度
    func heightIteration() -> Int {
        guard let root = root else {
            return 0
        }
        
        var height = 0
        
        var queue: [TreeNode<T>] = [root]
        while !queue.isEmpty {
            let levelSize = queue.count
            for _ in 0 ..< levelSize {
                let node = queue.removeFirst()

                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            height += 1
        }
        return height
    }
    
    func height() -> Int {
        height(root)
    }
    
    func height(_ node: TreeNode<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        return 1 + max(height(node.left), height(node.right))
    }
    
    // 是否完全二叉树
    func isComplete() -> Bool {
        guard let root = root else {
            return false
        }
        
        var leaf = false
        
        var queue: [TreeNode<T>?] = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if leaf && !node!.isLeaf() {
                return false
            }
            
            if node?.left != nil {
                queue.append(node?.left)
            } else if node?.right != nil {
               return false
            }
            
            if node?.right != nil {
                queue.append(node?.right)
            } else {
                leaf = true
            }
        }
        return true
    }
}

// 前驱、后继
extension BinaryTree {
    // 前驱节点
    func predecessor(_ node: TreeNode<T>?) -> TreeNode<T>? {
        if node == nil {
            return nil
        }
        
        var p: TreeNode<T>? = node?.left
        
        if p != nil {
            while p?.right != nil {
                p = p?.right
            }
            return p
        }
        
        p = node
        
        while p?.parent != nil && p == p?.parent?.left {
            p = p?.parent
        }
        
        return p?.parent
    }
    
    // 后继节点
    func successor(_ node: TreeNode<T>?) -> TreeNode<T>? {
        if node == nil {
            return nil
        }
        
        var p: TreeNode<T>? = node?.right
        
        if p != nil {
            while p?.left != nil {
                p = p?.left
            }
            return p
        }
        
        p = node
        
        while p?.parent != nil && p == node?.parent?.right {
            p = p?.parent
        }
        
        return p?.parent
    }
}
