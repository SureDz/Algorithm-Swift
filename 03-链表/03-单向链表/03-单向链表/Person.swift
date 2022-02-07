//
//  Person.swift
//  AlgorithmWithSwift
//
//  Created by Sure_Dz on 2021/12/28.
//

import Foundation

class Person {
    private var age = 0
    private var name = ""
   
    init() {
        
    }
   
    convenience init(age: Int, name: String) {
        self.init()
        self.age = age
        self.name = name
    }
}
// print
extension Person: CustomStringConvertible {
    var description: String {
        return "{age = \(age), name = \(name)}"
    }
}
// ==
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age
    }
}
