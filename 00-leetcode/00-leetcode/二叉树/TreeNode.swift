//
//  TreeNode.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/24.
//

import Foundation

public class TreeNode: CustomStringConvertible {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func toString(_ node: TreeNode?, _ prefix: String, _ oldResult: String) -> String {
        if node == nil {
            return oldResult
        }
        
        var result = oldResult + prefix + "\(node!.val)" + "\n"
        result = toString(node?.left, prefix + "L---", result)
        result = toString(node?.right, prefix + "R---", result)
        return result
    }
    public var description: String {
        toString(self, "", "")
    }
}

extension TreeNode: Hashable, Equatable {
   public func hash(into hasher: inout Hasher) {
       // 用于唯一标识
       hasher.combine(val)
       hasher.combine(ObjectIdentifier(self))
   }
   public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
       return lhs === rhs
   }
}
