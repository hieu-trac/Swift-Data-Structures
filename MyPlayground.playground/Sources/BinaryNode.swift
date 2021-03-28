import Foundation

final public class BinaryNode<T> {
    
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func height() -> Int {
        return height(of: self)
    }
    
    public func height(of node: BinaryNode?) -> Int {
        guard let node = node else {
            return -1
        }
        return 1 + Swift.max(height(of: node.leftChild), height(of: node.rightChild))
    }
}

extension BinaryNode: TraversableBinaryNode { }

extension BinaryNode {
    
    public func traversePreOrderInclusive(visit: (T?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traversePreOrderInclusive(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.traversePreOrderInclusive(visit: visit)
        } else {
            visit(nil)
        }
    }
}

extension BinaryNode {
    
    public func serialize() -> [T?] {
        var array: [T?] = []
        traversePreOrderInclusive { array.append($0) }
        return array
    }
    
    public static func deserialize(_ array: [T?]) -> BinaryNode? {
        var reversed = Array(array.reversed())
        return deserialize(&reversed)
    }
    
    private static func deserialize(_ array: inout [T?]) -> BinaryNode? {
        guard !array.isEmpty, let value = array.removeLast() else {
          return nil
        }
        let node = BinaryNode(value)
        node.leftChild = deserialize(&array)
        node.rightChild = deserialize(&array)
        return node
    }
}

extension BinaryNode {
    public var min: BinaryNode {
        leftChild?.min ?? self
    }
    
    public var max: BinaryNode {
        rightChild?.max ?? self
    }
}

extension BinaryNode where T: Comparable {
    public var isBinarySearchTree: Bool {
        isBST(self, min: nil, max: nil)
    }
    
    private func isBST(_ tree: BinaryNode<T>?, min: T?, max: T?) -> Bool {
        guard let tree = tree else {
            return true
        }
        
        if let min = min, tree.value <= min {
            return false
        } else if let max = max, tree.value > max {
            return false
        }
        
        return isBST(tree.leftChild, min: min, max: tree.value) &&
            isBST(tree.rightChild, min: tree.value, max: max)
    }
}

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
