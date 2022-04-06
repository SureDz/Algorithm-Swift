//
//  SureSet.swift
//  09-集合
//
//  Created by Sure_Dz on 2022/4/7.
//

import Foundation

protocol SureSet {
    
    associatedtype Element
    
    func size() -> Int
    
    func isEmpty() -> Bool
    
    mutating func clear()
    
    mutating func add(_ element: Element?)
    
    mutating func remove(_ element: Element?)
    
    func contains(_ element: Element?) -> Bool
     
    func traversal(visitor: Visitor<Element>)
  
}
