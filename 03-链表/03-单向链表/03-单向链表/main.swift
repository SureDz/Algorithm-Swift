//
//  main.swift
//  03-链表
//
//  Created by Sure_Dz on 2022/1/4.
//

import Foundation


testLinked()

func testLinked() {
    var list = SureLinked<Int>()
    list.add(11)
    list.add(22)
    list.add(33)
    list.add(44)
    print(list)
    
    list.add(55, at: 0)
    list.add(66, at: 2)
    list.add(77, at: list.size)
    print(list.size)
    
    print(list.remove(index: 0) as Any)
    print(list.remove(index: 2) as Any)
    print(list.remove(index: list.size - 1) as Any)
    print(list)
}

func testArray() {
    var list = SureArray<Person>()
    list.add(Person(age: 12, name: "jay"))
    list.add(nil)
    list.add(Person(age: 12, name: "jayjay"))
    list.add(nil)
    list.add(Person(age: 12, name: "jayjay"))
    list.add(nil)
    list.remove(index: 3)
    print(list)
    list.remove(index: 2)
    print(list)
    let p = Person(age: 18, name: "sure")
    list.add(p)
    print(list)
    print(list.indexOf(p) as Any)
}









