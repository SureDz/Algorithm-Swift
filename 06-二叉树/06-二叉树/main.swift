//
//  main.swift
//  06- 二叉树
//
//  Created by Sure_Dz on 2022/3/4.
//

import Foundation

testbst()

func testbst() {
    let data = [7, 4, 9, 2, 5, 8, 11, 3, 12, 1]
    
    let bst: BST<Int> = BST()
    for i in data {
        bst.add(i)
    }
    print(bst)
    bst.remove(7)
    print(bst)
    print(bst.contain(8))
  
//    print("preorder")
//    bst.preorder(visitor: Visitor(visit: {
//        print($0)
//        return $0 == 1
//    }))
//
//    print("inorder")
//    bst.inorder(visitor: Visitor(visit: {
//        print($0)
//        return $0 == 4
//    }))
//
//    print("postorder")
//    bst.postorder(visitor: Visitor(visit: {
//        print($0)
//        return $0 == 5
//    }))
//
//    print("levelorder")
//    bst.levelorder(visitor: Visitor(visit: {
//        print($0)
//        return $0 == 2
//    }))
//
//    print("height")
//    print(bst.height())
//    print(bst.height1())
//    print(bst.isComplete())
}
