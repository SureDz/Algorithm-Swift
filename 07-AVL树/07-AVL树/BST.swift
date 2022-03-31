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
        super.init()
    }
    
    override init() {
        self.comparator = nil
    }
    
    func createNode(_ element: T, _ parent: TreeNode<T>?) -> TreeNode<T> {
        TreeNode(element: element, parent: parent)
    }
    
    /**
     * 添加node之后的调整
     * @param node 新添加的节点
     */
     func afterAdd(_ node: TreeNode<T>) {}
    
    /**
     * 删除node之后的调整
     * @param node 被删除的节点
     */
    func afterRemove(_ node: TreeNode<T>) {}
    
    func add(_ element: T) {
        
        elementNullCheck(element)
        
        // 添加的是第一个节点
        if root == nil {
            root = createNode(element, nil)
            size += 1
            
            // 新添加节点之后的处理
            afterAdd(root!)
            return
        }
        
        // 添加的不是第一个节点
        // 找到父节点
        var parent = root
        var node = root
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
        
        let newNode = createNode(element, parent)
        
        // 看看插入到父节点的哪个位置
        if cmp > 0 {
            parent?.right = newNode
        } else if cmp < 0 {
            parent?.left = newNode
        }
        
        size += 1
        
        // 新添加节点之后的处理
        afterAdd(newNode)
    }
    
    func remove(_ element: T) {
        remove(node(element))
    }
    
    func remove(_ node: TreeNode<T>?) {
        if node == nil {
            return
        }
        
        size -= 1
        
        var curNode = node
        if curNode!.hasTwoChildren() { // 度为2的节点
            let sNode = successor(curNode)  // 找到后继节点
            curNode?.element = sNode!.element // 值覆盖
            curNode = sNode // 删除后继节点
        }
        
        // 删除curNode(一定是度为1或者度为0的节点)
        let replacement = curNode?.left != nil ? curNode?.left : curNode?.right
        
        if replacement != nil { // 删除度为1的节点
            // 更改parent
            replacement?.parent = curNode?.parent
            // 更改parent的left、right
            if curNode?.parent == nil { // 删除根节点
                root = replacement
            } else if curNode == curNode?.parent?.left {  // 删除的节点是左子节点
                curNode?.parent?.left = replacement
            } else if curNode == curNode?.parent?.right {  // 删除的节点是右子节点
                curNode?.parent?.right = replacement
            }
            
            // 删除节点之后的处理
            afterRemove(curNode!);
        } else if curNode?.parent == nil { // 删除度为0的节点且为根节点
            root = nil
            
            // 删除节点之后的处理
            afterRemove(curNode!);
        } else {
            // 删除的不是根节点
            if curNode == curNode?.parent?.left {  // 删除的节点是左子节点
                curNode?.parent?.left = replacement
            } else if curNode == curNode?.parent?.right { // 删除的节点是右子节点
                curNode?.parent?.right = replacement
            }
            
            // 删除节点之后的处理
            afterRemove(curNode!);
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
    
    private func elementNullCheck(_ element: T?) {
        if element == nil {
            fatalError("element must not be null")
        }
    }
}
