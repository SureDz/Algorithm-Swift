//
//  RBTree.swift
//  08-红黑树
//
//  Created by Sure_Dz on 2022/4/5.
//

import Foundation


class RBTree<T>: BBST<T> where T: Comparable {
   
    override init() {
        super.init()
    }
    
    override init(comparator: @escaping Comparator) {
        super.init(comparator: comparator)
    }
    
    override func createNode(_ element: T, _ parent: TreeNode<T>?) -> TreeNode<T> {
        RBNode(element: element, parent: parent)
    }
    
    override func afterAdd(_ node: TreeNode<T>) {
        
        let node = node as! RBNode<T>
        
        // 添加的是根节点 或者 上溢到达了根节点
        guard let parent = node.parent else {
            black(node)
            return
        }
        
        // 如果父节点是黑色，直接返回
        if isBlack(parent) {
            return
        }
        
        // 叔父节点
        let uncle = parent.sibling()
        
        // 祖父节点
        let grand = red(parent.parent)
        
        if isRed(uncle) { // 叔父节点红色 B树节点上溢
            black(parent)
            black(uncle)
            // 把祖父节点当做是新添加的节点
            afterAdd(grand!)
            return
        }
        
        // 叔父节点不是红色
        if parent.isLeftChild() { // L
            if node.isLeftChild() { // LL
                black(parent)
            } else { // LR
                black(node)
                rotateLeft(parent)
            }
            rotateRight(grand!)
        } else { // R
            if node.isLeftChild() { // RL
                black(node)
                rotateRight(parent)
            } else { // RR
                black(parent)
            }
            rotateLeft(grand!)
        }
        
    }
    
    override func afterRemove(_ node: TreeNode<T>) {
        // 如果删除的节点是红色
        // 或者 用以取代删除节点的子节点是红色
        if isRed(node) {
            black(node)
            return
        }
        
        guard let parent = node.parent else {  // 删除的是根节点
            return
        }
        
        // 删除的是黑色叶子节点【下溢】
        // 判断被删除的node是左还是右
        let left = parent.left == nil || node.isLeftChild()
        var sibling = left ? parent.right : parent.left
        if left {
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                rotateLeft(parent)
                // 更换兄弟
                sibling = parent.right
            }
            
            // 兄弟节点必然是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) {
                // 兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else {  // 兄弟节点至少有1个红色子节点，向兄弟节点借元素
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.right) {
                    rotateRight(sibling!)
                    sibling = parent.right
                }
                
                color(sibling, colorOf(parent))
                black(sibling?.right)
                black(parent)
                rotateLeft(parent)
            }
        } else {  // 被删除的节点在右边，兄弟节点在左边
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                rotateRight(parent)
                // 更换兄弟
                sibling = parent.left
            }
            
            // 兄弟节点必然是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) {
                // 兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else {  // 兄弟节点至少有1个红色子节点，向兄弟节点借元素
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.left) {
                    rotateLeft(sibling!)
                    sibling = parent.left
                }
                
                color(sibling, colorOf(parent))
                black(sibling?.left)
                black(parent)
                rotateRight(parent)
            }
        }
    }
    
}

extension RBTree {

    @discardableResult
    func color(_ node: TreeNode<T>?, _ color: Bool) -> TreeNode<T>? {
        if node == nil {
            return node
        }
    
        let node = node as! RBNode<T>
        node.color = color
        return node
    }

    @discardableResult
    func red(_ node: TreeNode<T>?) -> TreeNode<T>? {
        return color(node, RED)
    }
   
    @discardableResult
    func black(_ node: TreeNode<T>?) -> TreeNode<T>? {
       return  color(node, BLACK)
    }
    
    func colorOf(_ node: TreeNode<T>?) -> Bool {
        if node == nil {
            return BLACK
        }
    
        let node = node as! RBNode<T>
        return node.color
    }
    
    func isBlack(_ node: TreeNode<T>?) -> Bool {
        colorOf(node) == BLACK
    }
    
    func isRed(_ node: TreeNode<T>?) -> Bool {
        colorOf(node) == RED
    }
    
}

