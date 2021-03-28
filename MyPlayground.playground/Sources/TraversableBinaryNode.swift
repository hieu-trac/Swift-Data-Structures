import Foundation

public protocol TraversableBinaryNode {
    associatedtype T
    var value: T { get }
    var leftChild: Self? { get }
    var rightChild: Self? { get }
    func traverseInOrder(visit: (T) -> Void)
    func traversePreOrder(visit: (T) -> Void)
    func traversePostOrder(visit: (T) -> Void)
}

public extension TraversableBinaryNode {
    
    func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}
