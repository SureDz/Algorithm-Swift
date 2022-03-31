//
//  AVLNode.swift
//  07-AVL树
//
//  Created by Sure_Dz on 2022/3/30.
//

import Foundation

public class AVLNode<T>: TreeNode<T> where T: Equatable {
    
    var height = 1
  
    override init(element: T, parent: TreeNode<T>?) {
        super.init(element: element, parent: parent)
    }
    
    // 平衡因子 -1 0 1
    var balanceFactor: Int {
        let leftAVL = self.left as? AVLNode<T>
        let rightAVL = self.right as? AVLNode<T>
        let leftH = leftAVL == nil ? 0 : leftAVL!.height
        let rightH = rightAVL == nil ? 0 : rightAVL!.height
        
        return leftH - rightH
    }
    
    // 更新高度
    func updateHeight() {
        let leftAVL = self.left as? AVLNode<T>
        let rightAVL = self.right as? AVLNode<T>
        let leftH = leftAVL == nil ? 0 : leftAVL!.height
        let rightH = rightAVL == nil ? 0 : rightAVL!.height
        
        return height = 1 + max(leftH, rightH)
    }
    
    // 好大儿
    func tallerChild() -> AVLNode<T> {
        let leftAVL = self.left as? AVLNode<T>
        let rightAVL = self.right as? AVLNode<T>
        let leftH = leftAVL == nil ? 0 : leftAVL!.height
        let rightH = rightAVL == nil ? 0 : rightAVL!.height

        if leftH > rightH { return leftAVL! }
        if leftH < rightH { return rightAVL! }
        return isLeftChild() ? leftAVL! : rightAVL!
    }
    
    public override var description: String {
        var parentStr = "nil"
        if parent != nil {
            parentStr = "\(parent!.element)"
        }
        return "\(element)" + "_p(" + parentStr + ")_h(" + "\(height)" + ")"
    }
}
