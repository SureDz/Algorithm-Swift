//
//  TreeNode.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/29.
//

import Foundation

public class TreeNode<T> {
    
    var element: T
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    
    init(element: T, parent: TreeNode?) {
        self.element = element
        self.parent = parent
    }
    
    func isLeaf() -> Bool {
        left == nil && right == nil
    }
    
    func hasTwoChildren() -> Bool {
        left != nil && right != nil
    }
    
}

extension TreeNode: Equatable where T: Equatable {

    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.element == rhs.element
    }

}

extension TreeNode: Comparable where T: Comparable {
  
    public static func < (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.element < rhs.element
    }
    
}

extension TreeNode: CustomStringConvertible {
  
    public var description: String {
        "\(element)"
    }
    
}
