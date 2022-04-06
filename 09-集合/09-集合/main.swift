//
//  main.swift
//  09-集合
//
//  Created by Sure_Dz on 2022/4/7.
//

import Foundation

testSet()
func testSet() {
    let set = SureTreeSet<Int>()
    for _ in 0...9999 {
        let e =  Int(arc4random() % 100) + 1
        set.add(e)
    }

    set.traversal(visitor: Visitor(visit: {
        print($0)
        return false
    }))
//    let set = SureListSet<Int>()
//    for _ in 0...9999 {
//        let e =  Int(arc4random() % 100) + 1
//        set.add(e)
//    }
//    
//    set.traversal(visitor: Visitor(visit: {
//        print($0)
//        return $0 == 1
//    }))
}
