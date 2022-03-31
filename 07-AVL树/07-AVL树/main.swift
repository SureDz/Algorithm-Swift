//
//  main.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/29.
//

import Foundation

testbst()

func testbst() {
    let data = [67, 52, 92, 96, 53, 95, 13, 63, 34, 82, 76, 54, 9, 68, 39]
    
    let avl: AVLTree<Int> = AVLTree()
    for i in 0 ..< data.count {
        avl.add(data[i])
//        print("【" + "\(data[i])" + "】");
//        print(avl)
//        print("--------------")
    }
   
    for i in 0 ..< data.count {
        avl.remove(data[i])
        print("【" + "\(data[i])" + "】");
        print(avl)
        print("--------------")
    }

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
//        return $0 == 20
//    }))
//
//    print("height")
//    print(bst.height())
//    print(bst.heightIteration())
//    print(bst.isComplete())
    
}
