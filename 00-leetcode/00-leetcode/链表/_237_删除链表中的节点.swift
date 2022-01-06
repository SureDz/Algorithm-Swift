//
//  _237_删除链表中的节点.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/5.
//

import Foundation
/**
 * https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
 */

class _237_删除链表中的节点 {
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? -1
        node?.next = node?.next?.next
    }
}
