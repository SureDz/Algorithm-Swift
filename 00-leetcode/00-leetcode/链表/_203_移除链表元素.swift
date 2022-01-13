//
//  _203_移除链表元素.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/6.
//

import Foundation
/**
 * https://leetcode-cn.com/problems/remove-linked-list-elements/
 */
public class _203_移除链表元素 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {

        var head = head
        
        while head != nil && head?.val == val {
            head = head?.next
        }
        
        if head == nil {
            return head
        }
       
        var prev = head
        while prev?.next != nil {
            if prev?.next?.val == val {
                prev?.next = prev?.next?.next
            } else {
                prev = prev?.next
            }
        }
        
        return head
    }
}
