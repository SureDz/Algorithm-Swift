//
//  RBNode.swift
//  08-红黑树
//
//  Created by Sure_Dz on 2022/4/5.
//

import Foundation

let RED = false
let BLACK = true

public class RBNode<T>: TreeNode<T> where T: Comparable {
    
    var color: Bool = RED
    
    override init(element: T, parent: TreeNode<T>?) {
        super.init(element: element, parent: parent)
    }
    
    public override var description: String {
        var str = ""
        if color == RED {
            str = "R_"
        }
        return str + "\(element)"
    }
}
