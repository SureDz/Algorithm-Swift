//
//  _141_环形链表.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation
/**
 * https://leetcode-cn.com/problems/linked-list-cycle/
 */
class _141_环形链表 {
    // 快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            if slow == fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
