//
//  ListNode.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
  
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        "\(val)" + (next == nil ?  "" :  "_" + next!.description)
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
}
