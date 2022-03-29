//
//  main.swift
//  02-动态数组
//
//  Created by Sure_Dz on 2021/12/29.
//

import Foundation

var list = SureArray<Any>()
list.add(10);
list.add(nil);
list.add(Person(age: 10, name: "Jack"));
list.add(1);
list.add(2);
list.add(3);
list.add(4);
list.add(5);
list.add(6);
list.add(7);
list.add(8);

print(list)
list.remove(index: 3)
print(list)
print(list.getElement(at: 2) as Any)
list.setElement(18, at: 1)
print(list)

var persons  = SureArray<Person>()
persons.add(Person(age: 10, name: "Jack"));
persons.add(nil);
persons.add(Person(age: 15, name: "Rose"));
persons.add(nil);
var p = Person(age: 12, name: "James")
persons.add(p);
persons.add(nil);

print(persons)
print(persons.indexOf(p) as Any);

