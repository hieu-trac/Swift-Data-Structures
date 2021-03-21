import Foundation

public protocol Queue {
    associatedtype Element
    
    @discardableResult mutating func enqueue(_ element: Element) -> Bool
    
    @discardableResult mutating func dequeue() -> Element?
    
    var isEmpty: Bool { get }
    
    var peek: Element? { get }
}
