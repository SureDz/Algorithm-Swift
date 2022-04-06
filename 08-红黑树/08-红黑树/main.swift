//
//  main.swift
//  08-红黑树
//
//  Created by Sure_Dz on 2022/4/5.
//

import Foundation

testRBTree()

func testRBTree() {
    let data = [67, 52, 92, 96, 53, 95, 13, 63, 34, 82, 76, 54, 9, 68, 39]
    
    let tree: RBTree<Int> = RBTree()
    for i in 0 ..< data.count {
        tree.add(data[i])
//        print("【" + "\(data[i])" + "】");
//        print(tree)
//        print("--------------")
    }
   
    for i in 0 ..< data.count {
        tree.remove(data[i])
        print("【" + "\(data[i])" + "】");
        print(tree)
        print("--------------")
    }
}
