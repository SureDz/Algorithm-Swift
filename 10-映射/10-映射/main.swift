//
//  main.swift
//  10-映射
//
//  Created by Sure_Dz on 2022/4/9.
//

import Foundation

testSet()

func testSet() {
    let data = [
        83, 17, 86, 5, 92, 38, 30, 9, 26, 71, 14, 81, 7, 79
    ]
    let treeSet = TreeSet<Int>()
    for i in data {
        treeSet.add(i)
        print("【" + "\(i)" + "】");
        print(treeSet)
        print("--------------")
    }
    
    for i in data {
        treeSet.remove(i)
        print("【" + "\(i)" + "】");
        print(treeSet)
        print("--------------")
    }
}

//
//testMap()
//
//func testMap() {
//    let data = [
//        83, 17, 86, 5, 92, 38, 30, 9, 26, 71, 14, 81, 7, 79
//    ]
//    let treeMap = TreeMap<Int, String>()
//    for i in data {
//        let str = "\(arc4random() % 100)"
//        treeMap.put(i, str)
////        print("【" + "\(i)" + "】");
////        print(treeMap)
////        print("--------------")
//    }
//
//    for i in data {
//        treeMap.remove(i)
//        print("【" + "\(i)" + "】");
//        print(treeMap)
//        print("--------------")
//    }
//
//    print(treeMap)
//}

