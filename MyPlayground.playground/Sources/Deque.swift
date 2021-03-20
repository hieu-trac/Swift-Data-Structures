import Foundation

public enum Direction {
    case front
    case back
}

public protocol Deque {
    associatedtype Element
    var isEmpty: Bool { get }
    func peek(from direction: Direction) -> Element?
    mutating func enqueue(_ element: Element, to direction: Direction) -> Bool
    mutating func dequeue(from direction: Direction) -> Element?
}
