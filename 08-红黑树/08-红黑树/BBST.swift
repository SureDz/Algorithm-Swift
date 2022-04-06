//
//  BBST.swift
//  08-红黑树
//
//  Created by Sure_Dz on 2022/4/5.
//

import Foundation

class BBST<T>: BST<T> where T: Comparable {
    
    override init() {
        super.init()
    }
    
    override init(comparator: @escaping Comparator) {
        super.init(comparator: comparator)
    }
    
    func rotateLeft(_ grand: TreeNode<T>) {
        let parent = grand.right!
        let child = parent.left
        grand.right = child
        parent.left = grand
        afterRotate(grand, parent, child)
    }
    
    func rotateRight(_ grand: TreeNode<T>) {
        let parent = grand.left!
        let child = parent.right
        grand.left = child
        parent.right = grand
        afterRotate(grand, parent, child)
    }
    
    func afterRotate(_ grand: TreeNode<T>, _ parent: TreeNode<T>, _ child: TreeNode<T>?) {
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
    }
    
    func rotate(_ r: TreeNode<T>,
                _ b: TreeNode<T>, _ c: TreeNode<T>?,
                _ d: TreeNode<T>,
                _ e: TreeNode<T>?, _ f: TreeNode<T>) {
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
        
        // e-f
        f.left = e
        if e != nil {
            e?.parent = f
        }
        
        // b-d-f
        d.left = b
        d.right = f
        b.parent = d
        f.parent = d
    }
}
