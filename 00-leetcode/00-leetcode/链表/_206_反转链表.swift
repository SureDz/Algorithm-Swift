//
//  _206_反转链表.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation

class _206_反转链表 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var oldHead = head
        
        var newHead: ListNode? = nil
        
        while oldHead != nil {
            let temp: ListNode? = oldHead?.next
            oldHead?.next = newHead;
            newHead = oldHead
            oldHead = temp
        }
        return newHead
    }
}
