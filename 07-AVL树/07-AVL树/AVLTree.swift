//
//  AVLTree.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/30.
//

import Foundation

class AVLTree<T>: BST<T> where T: Comparable {
    
    override init() {
        super.init()
    }
    
    override init(comparator: @escaping Comparator) {
        super.init(comparator: comparator)
    }
    
    override func createNode(_ element: T, _ parent: TreeNode<T>?) -> TreeNode<T> {
        AVLNode(element: element, parent: parent)
    }
    

    override func afterAdd(_ node: TreeNode<T>) {
        var node = node
        while node.parent != nil {
            node = node.parent!
            if isBalance(node) {
              // 更新高度
              updateHeight(node)
            } else {
              // 恢复平衡
              rebalance(node)
              // 整棵树恢复平衡
              break
            }
        }
    }

    override func afterRemove(_ node: TreeNode<T>) {
        var node = node
        while node.parent != nil {
            node = node.parent!
            if isBalance(node) {
                // 更新高度
                updateHeight(node)
            } else {
                // 恢复平衡
                rebalance(node)
            }
        }
    }
    
    func updateHeight(_ node: TreeNode<T>) {
        let node = node as! AVLNode<T>
        node.updateHeight()
    }
    
    func isBalance(_ node: TreeNode<T>) -> Bool {
        let node = node as! AVLNode<T>
        return abs(node.balanceFactor) <= 1
    }
}

extension AVLTree {
    /**
     * 恢复平衡
     * @param grand 高度最低的那个不平衡节点
     */
    func rebalance2(_ grand: TreeNode<T>) {
        let grand = grand as! AVLNode<T>
        let parent = grand.tallerChild()
        let child = parent.tallerChild()
        if parent.isLeftChild() { // L
            if child.isLeftChild() { // LL
                rotateRight(grand)
            } else { // LR
                rotateLeft(parent)
                rotateRight(grand)
            }
        } else { // R
            if child.isLeftChild() { // RL
                rotateRight(parent)
                rotateLeft(grand)
            } else { // RR
                rotateLeft(grand)
            }
        }
    }
    
    func rotateLeft(_ grand: AVLNode<T>) {
        let parent = grand.right as! AVLNode<T>
        let child = parent.left as? AVLNode<T>
        grand.right = child
        parent.left = grand
        afterRotate(grand, parent, child)
    }
    
    func rotateRight(_ grand: AVLNode<T>) {
        let parent = grand.left as! AVLNode<T>
        let child = parent.right as? AVLNode<T>
        grand.left = child
        parent.right = grand
        afterRotate(grand, parent, child)
    }
    
    func afterRotate(_ grand: AVLNode<T>, _ parent: AVLNode<T>, _ child: AVLNode<T>?) {
        // 让parent成为子树的根节点
        parent.parent = grand.parent
        if grand.isLeftChild() {
            grand.parent?.left = parent
        } else if grand.isRightChild() {
            grand.parent?.right = parent
        } else {
            root = parent
        }
        
        // 更新child的parent
        if child != nil {
            child?.parent = grand
        }
                
        // 更新grand的parent
        grand.parent = parent
                
        // 更新高度
        updateHeight(grand)
        updateHeight(parent)
    }
}
 
extension AVLTree {
    func rebalance(_ grand: TreeNode<T>) {
        let grand = grand as! AVLNode<T>
        let parent = grand.tallerChild()
        let child = parent.tallerChild()
        if parent.isLeftChild() { // L
            if child.isLeftChild() { // LL
                rotate(grand, child, child.right as? AVLNode<T> , parent, parent.right as? AVLNode<T>, grand)
            } else { // LR
                rotate(grand, parent, child.left as? AVLNode<T>, child, child.right as? AVLNode<T>, grand)
            }
        } else { // R
            if child.isLeftChild() { // RL
                rotate(grand, grand, child.left as? AVLNode<T>, child, child.right as? AVLNode<T>, parent)
            } else { // RR
                rotate(grand, grand, parent.left as? AVLNode<T>, parent, child.left as? AVLNode<T>, child)
            }
        }
    }
    
    func rotate(_ r: AVLNode<T>,
                _ b: AVLNode<T>, _ c: AVLNode<T>?,
                _ d: AVLNode<T>,
                _ e: AVLNode<T>?, _ f: AVLNode<T>) {
        // 让d成为这棵树的根节点
        d.parent = r.parent
        if r.isLeftChild() {
            r.parent?.left = d
        } else if r.isRightChild() {
            r.parent?.right = d
        } else {
            root = d
        }
        
        // b-c
        b.right = c
        if c != nil {
            c?.parent = b
        }
        updateHeight(b)
        
        // e-f
        f.left = e
        if e != nil {
            e?.parent = f
        }
        updateHeight(f)
        
        // b-d-f
        d.left = b
        d.right = f
        b.parent = d
        f.parent = d
        updateHeight(d)
    }
}

