//
//  _83_删除排序链表中的重复元素.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation
/**
 * https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 */

class _83_删除排序链表中的重复元素 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var prev = head
        while prev?.next != nil {
            if prev?.next?.val == prev?.val {
                prev?.next = prev?.next?.next
            } else {
                prev = prev?.next
            }
        }
        return head
    }
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        head?.next = deleteDuplicates(head?.next)
        if head?.val == head?.next?.val {
            head?.next = head?.next?.next
        }
        
        return head
    }
}
