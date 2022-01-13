//
//  _876_链表的中间结点.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation

/**
 * https://leetcode-cn.com/problems/middle-of-the-linked-list/
 * @author Dz
 *
 */
class _876_链表的中间结点 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}
