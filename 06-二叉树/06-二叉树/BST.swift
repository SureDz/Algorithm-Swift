//
//  BST.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/29.
//

import Foundation

class BST<T>: BinaryTree<T> where T: Comparable {
    
    var comparator: Comparator?
    
    init(comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    override init() {
        self.comparator = nil
    }
    
    func add(_ element: T) {
        elementNullCheck(element)
        
        // 添加的是第一个节点
        if root == nil {
            root = TreeNode(element: element, parent: nil)
            size += 1
            return
        }
        
        // 添加的不是第一个节点
        // 找到父节点
        var parent: TreeNode<T>? = root
        var node: TreeNode<T>? = root
        var cmp = 0
        while node != nil {
            cmp = compare(lt: element, rt: node!.element)
            parent = node
            if cmp > 0 {
                node = node?.right
            } else if cmp < 0 {
                node = node?.left
            } else {
                node?.element = element
                return
            }
        }
        
        let newNode: TreeNode<T>? = TreeNode(element: element, parent: parent)
        
        if cmp > 0 {
            parent?.right = newNode
        } else {
            parent?.left = newNode
        }
        size += 1
    }
    
    func compare(lt: T, rt: T) -> Int {
        if comparator != nil {
            return comparator!(lt, rt).rawValue
        }
        if lt == rt {
            return 0
        } else if lt < rt {
            return -1
        }
        return 1
    }
    
    func remove(_ element: T) {
        remove(node(element))
    }
    
    func remove(_ node: TreeNode<T>?) {
        if node == nil {
            return
        }
        
        var curNode: TreeNode<T>? = node
        
        if curNode!.hasTwoChildren() { // 度为2的节点
            let sNode: TreeNode<T>? = successor(curNode) // 找到后继节点
            
            curNode!.element = sNode!.element // 值覆盖
            
            curNode = sNode // 删除后继节点
        }
        
        // 删除curNode(一定是度为1或者度为0的节点)
        let replacement: TreeNode<T>? = curNode?.left != nil ? curNode?.left : curNode?.right
        
        if replacement != nil { // 度为1的节点
            replacement?.parent = curNode?.parent
            if curNode?.parent == nil { // 删除的节点是根节点
                root = replacement
            } else if curNode == curNode?.parent?.left { // 删除的节点是左子节点
                curNode?.parent?.left = replacement
            } else if curNode == curNode?.parent?.right { // 删除的节点是右子节点
                curNode?.parent?.right = replacement
            }
        } else { // 度为0的节点
            if curNode?.parent == nil { // 删除的节点是根节点
                root = nil
            } else { // 删除的不是根节点
                if curNode == curNode?.parent?.left { // 删除的节点是左子节点
                    curNode?.parent?.left = nil
                } else if curNode == curNode?.parent?.right { // 删除的节点是右子节点
                    curNode?.parent?.right = nil
                }
            }
        }
    }
    
    func contain(_ element: T) -> Bool {
        node(element) != nil
    }
    
    func node(_ element: T) -> TreeNode<T>? {
        var node: TreeNode<T>? = root
        while node != nil {
            if node?.element == element {
                return node;
            } else if (node!.element > element) {
                node = node?.left
            } else if (node!.element < element) {
                node = node?.right
            }
        }
        return nil
    }
    
    private func elementNullCheck(_ element: T?) {
        if element == nil {
            fatalError("element must not be null")
        }
    }
}
