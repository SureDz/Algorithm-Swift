//
//  TreeMap.swift
//  10-映射
//
//  Created by Sure_Dz on 2022/4/9.
//

import Foundation

let RED = false
let BLACK = true

class TreeMap<K: Comparable, V: Equatable>: Map {
    
    private var size: Int = 0
    
    private var root: TreeNode<K, V>? = nil
    
    private var comparator: Comparator?

    init() {
        size = 0
        root = nil
        comparator = nil
    }
    
    convenience init(comparator: @escaping Comparator) {
        self.init()
        self.comparator = comparator
    }
    
    func count() -> Int {
        size
    }
    
    func clear() {
        root = nil
        size = 0
    }
    
    @discardableResult
    func put(_ key: K, _ value: V) -> V? {
    
        // 添加根节点
        if root == nil {
            root = createNode((key, value), nil)
            size += 1
            afterPut(root!)
            return nil
        }
        
        // 子节点
        var cmp = 0
        var parent = root
        var node = root
        while node != nil {
            parent = node
            cmp = compare(lk: key, rk: node!.key)
            if cmp < 0 {
                node = node?.left
            } else if cmp > 0 {
                node = node?.right
            } else {
                let oldValue = node?.value
                node?.value = value
                return oldValue
            }
        }
        
        let newNode = createNode((key, value), parent)
        if cmp < 0 {
            parent?.left = newNode
        } else if cmp > 0 {
            parent?.right = newNode
        }
        size += 1
        afterPut(newNode)
        return nil
    }
    
    func get(_ key: K) -> V? {
        guard let node = node(key) else {
            return nil
        }
        return node.value
    }
    
    func remove(_ key: K) -> V? {
        return remove(node(key))
    }
    
    func containsKey(_ key: K) -> Bool {
        return node(key) != nil
    }
    
    func containsValue(_ value: V) -> Bool {
        
        guard let root = root else {
            return false
        }

        var queue: [TreeNode<K, V>] = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.value == value {
                return true
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        
        return false
    }
    
    func traversal(visit: Visitor<K, V>) {
        traversal(visit: visit, root: root)
    }
    
    private func traversal(visit: Visitor<K, V>, root:TreeNode<K, V>?) {
        
        if root == nil || visit.stop {
            return
        }
        
        traversal(visit: visit, root: root!.left)
        if visit.stop {
            return
        }
        visit.stop = visit.visit(root!.key, root!.value)
        traversal(visit: visit, root: root!.right)
    }
}

// description
extension TreeMap: CustomStringConvertible {

    private func nodeBlank(_ count: Int) -> String {
        var blank = ""
        var count = count
        while count > 0 {
            count -= 1
            blank += " "
        }
        return blank
    }
    
    private func toString(node: TreeNode<K, V>?, nodePrefix: String, leftPrefix: String, rightPrefix: String) -> String {
        guard let node = node else {
            return ""
        }

        let left = node.left
        let right = node.right
        let str = node.description
        
        var length = str.count
        if (length % 2 == 0) {
            length -= 1
        }
        
        length >>= 1
        
        var result: String = ""
        if right != nil {
            let rightPrefix = rightPrefix + nodeBlank(length)
            result += toString(node: node.right, nodePrefix: rightPrefix + "┌──", leftPrefix: rightPrefix + "│  ", rightPrefix: rightPrefix + "   ")
        }
       
        result += nodePrefix + str + "\n"
        
        if left != nil {
            let leftPrefix = leftPrefix + nodeBlank(length)
            result += toString(node: node.left, nodePrefix: leftPrefix + "└──", leftPrefix: leftPrefix + "   ", rightPrefix: leftPrefix + "│  ")
        }

        return result
    }
    
    public var description: String {
        toString(node: root, nodePrefix: "", leftPrefix: "", rightPrefix: "")
    }

}

// private
extension TreeMap {
    
    private func createNode(_ element: (key: K, value: V), _ parent: TreeNode<K, V>?) -> TreeNode<K, V> {
        return TreeNode(element: element, parent: parent)
    }

    private func afterPut(_ node: TreeNode<K, V>) {
        // 添加的根节点 或者 上溢出根节点
        guard let parent = node.parent else {
            black(node)
            return
        }
        
        // 父节点是黑色
        if isBlack(parent) {
            return
        }
        
        // 父节点红色
        
        // 叔父节点
        let uncle = parent.sibling()
        // 祖父节点
        let grand = red(parent.parent)
        
        // 叔父节点红色 红黑红 祖父节点上溢
        if isRed(uncle) {
            black(parent)
            black(uncle)
            // 祖父节点上溢出，按新添加处理
            afterPut(grand!)
            return
        }
        
        // 叔父节点是黑色 黑红 红黑
        if parent.isLeftChild() { // L
            if node.isLeftChild() { // LL
                black(parent)
            } else {  // LR
                black(node)
                rotateLeft(parent)
            }
            rotateRight(grand!)
        } else { // R
            if node.isLeftChild() { // RL
                black(node)
                rotateRight(parent)
            } else {  // RR
                black(parent)
            }
            rotateLeft(grand!)
        }
    }
    
    private func remove(_ node: TreeNode<K, V>?) -> V? {
        
        guard var node = node else {
            return nil
        }

        size -= 1
        
        let oldValue = node.value
        
        // 度为2的节点
        if node.hasTwoChildren() {
            // 找到后继节点
            let s = successor(node)!
            // node kv 替换
            node.key = s.key
            node.value = s.value
            // 删除后继节点
            node = s
        }
        
        // 度为1或者叶子节点
        let replaceNode = node.left != nil ? node.left : node.right
        
        if replaceNode != nil { // 度为1的节点
            // parent
            replaceNode?.parent = node.parent
            // child
            if node.parent == nil { // 删除根节点
                root = replaceNode
            } else if node == node.parent?.left { // 删除左子节点
                node.parent?.left = replaceNode
            } else if node == node.parent?.right { // 删除右子节点
                node.parent?.right = replaceNode
            }
            
        } else if node.parent == nil { // 叶子结点且根节点
            root = nil
            
        } else { // 叶子结点且不是根节点
            if node == node.parent?.left { // 删除左子节点
               node.parent?.left = replaceNode
           } else if node == node.parent?.right { // 删除右子节点
               node.parent?.right = replaceNode
           }
        }
        
        afterRemove(node)
        return oldValue
    }
    
    private func afterRemove(_ node: TreeNode<K, V>) {
        // 删除节点红色
        // 或者 用以取代删除节点的子节点是红色
        if isRed(node) {
            black(node)
            return
        }
        
        // 删除根节点
        guard let parent = node.parent else {
            return
        }
        
        // 删除节点黑色【下溢】
        // 判断被删除的node是左还是右
        let left = parent.left == nil || node.isLeftChild()
        var sibling = left ? parent.right : parent.left
        if left {
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                rotateLeft(parent)
                // 更换兄弟
                sibling = parent.right
            }
            
            // 兄弟节点是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) { // 父节点下溢合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else { // 兄弟有子节点，跟兄弟借一个
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.right) {
                    rotateRight(sibling!)
                    sibling = parent.right
                }
                
                color(sibling, colorOf(parent))
                black(sibling?.right)
                black(parent)
                rotateLeft(parent)
            }
        } else {
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                rotateRight(parent)
                // 更换兄弟
                sibling = parent.left
            }
            
            // 兄弟节点是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) { // 父节点下溢合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else { // 兄弟有子节点，跟兄弟借一个
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.left) {
                    rotateLeft(sibling!)
                    sibling = parent.left
                }
                
                color(sibling, colorOf(parent))
                black(sibling?.left)
                black(parent)
                rotateRight(parent)
            }
        }
    }
    
    private func rotateLeft(_ grand: TreeNode<K, V>) {
        let parent = grand.right!
        let child = parent.left
        grand.right = parent.left
        parent.left = grand
        afterRotate(grand, parent, child)
    }
    
    private func rotateRight(_ grand: TreeNode<K, V>) {
        let parent = grand.left!
        let child = parent.right
        grand.left = parent.right
        parent.right = grand
        afterRotate(grand, parent, child)
    }
    
    private func afterRotate(_ grand: TreeNode<K, V>, _ parent: TreeNode<K, V>, _ child: TreeNode<K, V>?) {
        // 让parent成为根节点
        parent.parent = grand.parent
        if grand.isLeftChild() {
            grand.parent?.left = parent
        } else if grand.isRightChild() {
            grand.parent?.right = parent
        } else {
            root = parent
        }
        
        // 更新child的parent
        if child != nil {
            child?.parent = grand
        }
        
        // 更新grand的parent
        grand.parent = parent
    }
    
    func compare(lk: K, rk: K) -> Int {
        if comparator != nil {
            return comparator!(lk, rk).rawValue
        }
        
        if lk < rk {
            return -1
        } else if lk > rk {
            return 1
        }
        return 0
    }
    
    private func node(_ key: K) -> TreeNode<K, V>? {
        var node = root
        while node != nil {
            let cmp = compare(lk: key, rk: node!.key)
            if cmp == 0 {
                return node;
            } else if (cmp > 0) {
                node = node?.right
            } else if (cmp < 0) {
                node = node?.left
            }
        }
        return nil
    }

}

// 遍历 前驱 后继
extension TreeMap {
    
    private func predecessor(_ node: TreeNode<K, V>) -> TreeNode<K, V>? {
        
        var p = node.left
        
        if p != nil {
            while p?.right != nil {
                p = p?.right
            }
            return p
        }
        
        p = node
        
        while p?.parent != nil && p == p?.parent?.left {
            p = p?.parent
        }
        
        return p?.parent
    }
    
    private func successor(_ node: TreeNode<K, V>) -> TreeNode<K, V>? {
        
        var s = node.right
        
        if s != nil {
            while s?.left != nil {
                s = s?.left
            }
            return s
        }
        
        s = node
        
        while s?.parent != nil && s == s?.parent?.right {
            s = s?.parent
        }
        
        return s?.parent
    }
    
}

// tool
extension TreeMap {
    
    @discardableResult
    private func color(_ node: TreeNode<K, V>?, _ color: Bool) -> TreeNode<K, V>? {
        guard let node = node else {
            return node
        }
        node.color = color
        return node
    }

    @discardableResult
    private func red(_ node: TreeNode<K, V>?) -> TreeNode<K, V>? {
        return color(node, RED)
    }
   
    @discardableResult
    private  func black(_ node: TreeNode<K, V>?) -> TreeNode<K, V>? {
       return  color(node, BLACK)
    }
    
    private func colorOf(_ node: TreeNode<K, V>?) -> Bool {
        guard let node = node else {
            return BLACK
        }
        return node.color
    }
    
    private func isBlack(_ node: TreeNode<K, V>?) -> Bool {
        colorOf(node) == BLACK
    }
    
    private func isRed(_ node: TreeNode<K, V>?) -> Bool {
        colorOf(node) == RED
    }
}

// node
extension TreeMap {
    private class TreeNode<K: Comparable, V>: Equatable {
    
        static func == (lhs: TreeNode<K, V>, rhs: TreeNode<K, V>) -> Bool {
            lhs.key == rhs.key
        }
        
        var key: K
        
        var value: V
        
        var color: Bool = RED
        
        var left: TreeNode?
        
        var right: TreeNode?
        
        var parent: TreeNode?
        
        init(element: (key: K, value: V), parent: TreeNode?) {
            self.key = element.key
            self.value = element.value
            self.parent = parent
        }
        
        func isLeaf() -> Bool {
            left == nil && right == nil
        }
        
        func hasTwoChildren() -> Bool {
            left != nil && right != nil
        }
        
        public func isLeftChild() -> Bool {
            parent != nil && self == parent?.left
        }

        public func isRightChild() -> Bool {
            parent != nil && self == parent?.right
        }

        public func sibling() -> TreeNode? {
            if (isLeftChild()) {
                return parent?.right;
            }

            if (isRightChild()) {
                return parent?.left;
            }

            return nil;
        }
        
        public var description: String {
            var str = ""
            if color == RED {
                str = "R_"
            }
            return str + "(" + "\(key)" + ", " + "\(value)" + ")"
        }
    }
}
