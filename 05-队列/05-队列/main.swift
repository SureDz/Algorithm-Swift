//
//  main.swift
//  05-队列
//
//  Created by Sure_Dz on 2022/2/16.
//

import Foundation


circleDeque()
func circleDeque() {
    var circleDeque = SureCircleDeque<Int>()
    for i in 0..<10 {
        circleDeque.enQueueFront(i + 1)
        circleDeque.enQueueRear(i + 100)
    }
    print(circleDeque)
    
    for _ in 0..<3 {
        circleDeque.deQueueFront()
        circleDeque.deQueueRear()
    }
    print(circleDeque)
    
    circleDeque.enQueueFront(11)
    circleDeque.enQueueFront(12)
    print(circleDeque)
    while !circleDeque.isEmpty() {
        print(circleDeque.deQueueFront() as Any)
    }
}

//circleQueue()
//func circleQueue() {
//    var circleQueue = SureCircleQueue<Int>()
//
//
//    for i in 0..<10 {
//        circleQueue.enQueue(i)
//    }
//
//    for _ in 0..<5 {
//        circleQueue.deQueue()
//    }
//
//    for i in 15..<20 {
//        circleQueue.enQueue(i)
//    }
//
//    print(circleQueue)
//
//    circleQueue.enQueue(0)
//
//    print(circleQueue)
//
//    while !circleQueue.isEmpty() {
//        print(circleQueue.deQueue() as Any)
//    }
//}

//deque()
//func deque() {
//    var deque = SureDeque<Int>()
//    
//    deque.enQueueFront(11)
//    deque.enQueueFront(22)
//    deque.enQueueFront(33)
//    deque.enQueueRear(44)
//    deque.enQueueRear(55)
//    deque.enQueueRear(66)
//    
//    while !deque.isEmpty() {
//        print(deque.deQueueFront() as Any)
//    }
//}
//
//queue()
//func queue() {
//    var queue = SureQueue<Int>()
//    queue.enQueue(11)
//    queue.enQueue(22)
//    queue.enQueue(33)
//    queue.enQueue(44)
//    queue.enQueue(55)
//    queue.enQueue(66)
//    
//    while !queue.isEmpty() {
//        print(queue.deQueue() as Any)
//    }
//}

