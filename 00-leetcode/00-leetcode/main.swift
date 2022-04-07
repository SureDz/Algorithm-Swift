//
//  main.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/1/5.
//

import Foundation

test_两个数组的交集()
func test_两个数组的交集() {
    let solotion = _349_两个数组的交集()
    print(solotion.intersection([1, 2, 2, 3], [2, 2, 3, 4]))
}

//test_平衡二叉树()
//func test_平衡二叉树() {
//    let solotion = _110_平衡二叉树()
//
//    let n3 = TreeNode(15, nil, nil)
//    let n4 = TreeNode(7, nil, nil)
//    let l2 = TreeNode(20, n3, n4)
//    let r2 = TreeNode(9, nil, nil)
//
//
//
//    let root = TreeNode(3, l2, r2)
//    print(solotion.isBalanced(root))
//}

//test_对称二叉树()
//func test_对称二叉树() {
//    let solotion = _101_对称二叉树()
//
//    let n3 = TreeNode(3, nil, nil)
//    let n4 = TreeNode(4, nil, nil)
//    let l2 = TreeNode(2, n4, n3)
//    let r2 = TreeNode(2, n3, n4)
//
//
////    let n6 = TreeNode(6, nil, nil)
////
////    let l5 = TreeNode(5, n6, nil)
////    let l4 = TreeNode(4, l5, nil)
////
////    let r5 = TreeNode(5, nil, n6)
////    let r4 = TreeNode(4, nil, r5)
//
//    let root = TreeNode(3, l2, r2)
//    print(solotion.isSymmetric(root))
//}

//test_根据前序和后序遍历构造二叉树()
//func test_根据前序和后序遍历构造二叉树() {
//    let solotion = _889_根据前序和后序遍历构造二叉树()
//
//    let preorder = [1, 2, 4, 5, 3, 6, 7]
//    let postorder = [4, 5, 2, 6, 7, 3, 1]
//    print(solotion.constructFromPrePost(preorder, postorder) as Any)
//}

//test_从前序与中序遍历序列构造二叉树()
//func test_从前序与中序遍历序列构造二叉树() {
//    let solotion = _105_从前序与中序遍历序列构造二叉树()
//
//    let inorder = [9, 3, 15, 20, 7]
//    let preorder = [3, 9, 20, 15, 7]
//    print(solotion.buildTree(preorder, inorder) as Any)
//}

//test_从中序与后序遍历序列构造二叉树()
//func test_从中序与后序遍历序列构造二叉树() {
//    let solotion = _106_从中序与后序遍历序列构造二叉树()
//
//    let inorder = [9, 3, 15, 20, 7]
//    let postorder = [9, 15, 7, 20, 3]
//    print(solotion.buildTree(inorder, postorder) as Any)
//}

//test_N叉树的最大深度()
//func test_N叉树的最大深度() {
//    let solotion = _559_N叉树的最大深度()
//  
//    let root = Node(9)
//    let n1 = Node(1)
//    let n3 = Node(3)
//    let n5 = Node(5)
//    let n7 = Node(7)
//    root.children = [n1, n3, n5, n7]
//    let n2 = Node(2)
//    let n4 = Node(4)
//    n3.children = [n2, n4]
//    let n6 = Node(6)
//    let n8 = Node(8)
//    n7.children = [n6, n8]
//    print(solotion.maxDepth(root))
//}

//test_N叉树的后序遍历()
//func test_N叉树的后序遍历() {
//    let solotion = _590_N叉树的后序遍历()
//
//    let root = Node(9)
//    let n1 = Node(1)
//    let n3 = Node(3)
//    let n5 = Node(5)
//    let n7 = Node(7)
//    root.children = [n1, n3, n5, n7]
//    let n2 = Node(2)
//    let n4 = Node(4)
//    n3.children = [n2, n4]
//    let n6 = Node(6)
//    let n8 = Node(8)
//    n7.children = [n6, n8]
//    print(solotion.postorder(root))
//}

//test_N叉树的前序遍历()
//func test_N叉树的前序遍历() {
//    let solotion = _589_N叉树的前序遍历()
//  
//    let root = Node(9)
//    let n1 = Node(1)
//    let n3 = Node(3)
//    let n5 = Node(5)
//    let n7 = Node(7)
//    root.children = [n1, n3, n5, n7]
//    let n2 = Node(2)
//    let n4 = Node(4)
//    n3.children = [n2, n4]
//    let n6 = Node(6)
//    let n8 = Node(8)
//    n7.children = [n6, n8]
//    print(solotion.preorder(root))
//}

//test_二叉树最大宽度()
//func test_二叉树最大宽度() {
//    let solotion = _662_二叉树最大宽度()
//
//    let l25 = TreeNode(0, nil, nil)
//    let l24 = TreeNode(0, nil, l25)
//    let l23 = TreeNode(0, nil, l24)
//    let l22 = TreeNode(0, nil, l23)
//    let l21 = TreeNode(0, nil, l22)
//    let l20 = TreeNode(0, nil, l21)
//    let l19 = TreeNode(0, nil, l20)
//    let l18 = TreeNode(0, nil, l19)
//    let l17 = TreeNode(0, nil, l18)
//    let l16 = TreeNode(0, nil, l17)
//    let l15 = TreeNode(0, nil, l16)
//    let l14 = TreeNode(0, nil, l15)
//    let l13 = TreeNode(0, nil, l14)
//    let l12 = TreeNode(0, nil, l13)
//    let l11 = TreeNode(0, nil, l12)
//    let l10 = TreeNode(0, nil, l11)
//    let l9 = TreeNode(0, nil, l10)
//    let l8 = TreeNode(0, nil, l9)
//    let l7 = TreeNode(0, nil, l8)
//    let l6 = TreeNode(0, nil, l7)
//    let l5 = TreeNode(0, nil, l6)
//    let l4 = TreeNode(0, nil, l5)
//    let l3 = TreeNode(0, nil, l4)
//    let l2 = TreeNode(0, nil, l3)
//    let l1 = TreeNode(0, nil, l2)
//    let l0 = TreeNode(0, nil, l1)
//
//    let r25 = TreeNode(0, nil, nil)
//    let r24 = TreeNode(0, r25, nil)
//    let r23 = TreeNode(0, r24, nil)
//    let r22 = TreeNode(0, r23, nil)
//    let r21 = TreeNode(0, r22, nil)
//    let r20 = TreeNode(0, r21, nil)
//    let r19 = TreeNode(0, r20, nil)
//    let r18 = TreeNode(0, r19, nil)
//    let r17 = TreeNode(0, r18, nil)
//    let r16 = TreeNode(0, r17, nil)
//    let r15 = TreeNode(0, r16, nil)
//    let r14 = TreeNode(0, r15, nil)
//    let r13 = TreeNode(0, r14, nil)
//    let r12 = TreeNode(0, r13, nil)
//    let r11 = TreeNode(0, r12, nil)
//    let r10 = TreeNode(0, r11, nil)
//    let r9 = TreeNode(0, r10, nil)
//    let r8 = TreeNode(0, r9, nil)
//    let r7 = TreeNode(0, r8, nil)
//    let r6 = TreeNode(0, r7, nil)
//    let r5 = TreeNode(0, r6, nil)
//    let r4 = TreeNode(0, r5, nil)
//    let r3 = TreeNode(0, r4, nil)
//    let r2 = TreeNode(0, r3, nil)
//    let r1 = TreeNode(0, r2, nil)
//    let r0 = TreeNode(0, r1, nil)
//
//    let root = TreeNode(0, l0, r0)
//    print(solotion.widthOfBinaryTree(root))
//}

//test_二叉树的层序遍历()
//func test_二叉树的层序遍历() {
//    let solotion = _107_二叉树的层序遍历()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.levelOrderBottom(root))
//}

//test_二叉树的最大深度()
//func test_二叉树的最大深度() {
//    let solotion = _104_二叉树的最大深度()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.maxDepth(root))
//}

//test_二叉树的层序遍历()
//func test_二叉树的层序遍历() {
//    let solotion = _102_二叉树的层序遍历()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.levelOrder(root))
//}

//test_二叉树的后序遍历()
//func test_二叉树的后序遍历() {
//    let solotion = _145_二叉树的后序遍历()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.postorderTraversal(root))
//}

//test_二叉树的中序遍历()
//func test_二叉树的中序遍历() {
//    let solotion = _94_二叉树的中序遍历()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.inorderTraversal(root))
//}

//test_二叉树的前序遍历()
//func test_二叉树的前序遍历() {
//    let solotion = _144_二叉树的前序遍历()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(solotion.preorderTraversal(root))
//
//}

//invertTree()
//func invertTree() {
//    let invert = _226_翻转二叉树()
//    let tn6 = TreeNode(6, nil, nil)
//    let tn9 = TreeNode(9, nil, nil)
//    let tn7 = TreeNode(7, tn6, tn9)
//
//    let tn1 = TreeNode(1, nil, nil)
//    let tn3 = TreeNode(3, nil, nil)
//    let tn2 = TreeNode(2, tn1, tn3)
//    let root = TreeNode(4, tn2, tn7)
//    print(root)
//    print("------")
//    print(invert.invertTree(root)!)
//}

//myStack()
//func myStack() {
//    let stack = MyStack()
//    stack.push(11)
//    stack.push(22)
//    stack.push(33)
//    stack.push(44)
//    stack.push(55)
//    stack.push(66)
//
//    while !stack.empty() {
//        print(stack.pop())
//    }
//}

//myQueue()
//func myQueue() {
//    let queue = MyQueue()
//    queue.push(11)
//    queue.push(22)
//    queue.push(33)
//    queue.push(44)
//    queue.push(55)
//    queue.push(66)
//
//    while !queue.empty() {
//        print(queue.pop())
//    }
//}

//test_224_基本计算器()
//func test_224_基本计算器() {
//    let todo = _224_基本计算器()
//
//    print(todo.calculate("1 + 21 - (3+ 2)"))
//}

//test_150_逆波兰表达式()
//func test_150_逆波兰表达式() {
//    let todo = _150_逆波兰表达式求值()
//
//    print(todo.evalRPN(["2", "5", "3", "+", "*"]))
//}

//test_856_括号的分数()
//func test_856_括号的分数() {
//    let todo = _856_括号的分数()
//
//    print(todo.scoreOfParentheses("(()())"))
//}

//test_20_有效的括号()
//
//func test_20_有效的括号() {
//    let todo = _20_有效的括号()
//
//    print(todo.isValid2("}("))
//}

//func test_876_链表的中间结点() {
//    let todo = _876_链表的中间结点()
//    let node1 = ListNode(4)
//    let node2 = ListNode(4)
//    let node3 = ListNode(5)
//    let node4 = ListNode(5)
//    let node5 = ListNode(5)
//    let node6 = ListNode(9)
//    let node7 = ListNode(1)
////    let node8 = ListNode(1)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//    node4.next = node5
//    node5.next = node6
//    node6.next = node7
////    node7.next = node8
//    print(node1)
//
//    print(todo.middleNode(node1) as Any)
//}
//test_876_链表的中间结点()

//func test_83_删除排序链表中的重复元素() {
//    let todo = _83_删除排序链表中的重复元素()
//    let node1 = ListNode(4)
//    let node2 = ListNode(4)
//    let node3 = ListNode(5)
//    let node4 = ListNode(5)
//    let node5 = ListNode(5)
//    let node6 = ListNode(9)
//    let node7 = ListNode(1)
//    let node8 = ListNode(1)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//    node4.next = node5
//    node5.next = node6
//    node6.next = node7
//    node7.next = node8
//    print(node1)
//
//    print(todo.deleteDuplicates1(node1) as Any)
//}
//test_83_删除排序链表中的重复元素()

//func test_203_移除链表元素() {
//    let todo = _203_移除链表元素()
//    let node1 = ListNode(4)
//    let node2 = ListNode(4)
//    let node3 = ListNode(5)
//    let node4 = ListNode(9)
//    let node5 = ListNode(5)
//    let node6 = ListNode(1)
//    let node7 = ListNode(5)
//    let node8 = ListNode(4)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//    node4.next = node5
//    node5.next = node6
//    node6.next = node7
//    node7.next = node8
//    print(node1)
//
//    print(todo.removeElements(node1, 5) as Any)
//}
//test_203_移除链表元素()

//func test_141_环形链表() {
//    let todo = _141_环形链表()
//    let node1 = ListNode(4)
//    let node2 = ListNode(5)
//    let node3 = ListNode(9)
//    let node4 = ListNode(1)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
////    node4.next = node2
//    
//    print(todo.hasCycle(node1))
//}
//test_141_环形链表()

//func test_206_反转链表() {
//    let todo = _206_反转链表()
//    let node1 = ListNode(4)
//    let node2 = ListNode(5)
//    let node3 = ListNode(9)
//    let node4 = ListNode(1)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//
//    print(node1)
//    print(todo.reverseList(node1) as Any)
//
//    print(todo.reverseList1(node4) as Any)
//}
//test_206_反转链表()

//func test_237_删除链表中的节点() {
//    let todo = _237_删除链表中的节点()
//    let node1 = ListNode(4)
//    let node2 = ListNode(5)
//    let node3 = ListNode(9)
//    let node4 = ListNode(1)
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//
//    print(node1)
//
//    todo.deleteNode(node4)
//
//    print(node1)
//}
//
//test_237_删除链表中的节点()
