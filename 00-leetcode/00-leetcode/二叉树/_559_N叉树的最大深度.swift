//
//  _559_N叉树的最大深度.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/3/26.
//

import Foundation

class _559_N叉树的最大深度 {
//    func maxDepth(_ root: Node?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//
//        var height = 0
//        for child in root.children {
//            height = max(height, maxDepth(child))
//        }
//        return 1 + height
//    }
    
    
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var height = 0
        var queue: [Node] = [root]
    
        while !queue.isEmpty {
            let levelSize = queue.count
            for _ in 0 ..< levelSize {
                let node = queue.removeFirst()
                
                for child in node.children {
                    queue.append(child)
                }
            }
            height += 1
        }
        return height
    }
}
