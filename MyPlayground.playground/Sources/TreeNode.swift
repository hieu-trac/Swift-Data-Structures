import Foundation

public class TreeNode<T> {
    public var value: T
    public weak var parent: TreeNode?
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}

extension TreeNode {
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

extension TreeNode where T: CustomStringConvertible {
    public func printEachLevelOrder() {
        print(value)
        var queue = QueueArray<[TreeNode<T>]>()
        queue.enqueue(children)
        while let level = queue.dequeue() {
            print(level.map { $0.value.description }.joined(separator: " ") )
            var newLevel = [TreeNode<T>]()
            newLevel.append(contentsOf: level.flatMap { $0.children })
            if !newLevel.isEmpty {
                queue.enqueue(newLevel)
            }
        }
    }
}
