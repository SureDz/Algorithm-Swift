//
//  AVLTree.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/30.
//

import Foundation

class AVLTree<T>: BBST<T> where T: Comparable {
    
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
    
    override func afterRotate(_ grand: TreeNode<T>, _ parent: TreeNode<T>, _ child: TreeNode<T>?) {
        super.afterRotate(grand, parent, child)
        
        // 更新高度
        updateHeight(grand)
        updateHeight(parent)
    }
    
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
    
    override func rotate(_ r: TreeNode<T>, _ b: TreeNode<T>, _ c: TreeNode<T>?, _ d: TreeNode<T>, _ e: TreeNode<T>?, _ f: TreeNode<T>) {
        super.rotate(r, b, c, d, e, f)
        
        updateHeight(b)
        updateHeight(f)
        updateHeight(d)
    }
}
