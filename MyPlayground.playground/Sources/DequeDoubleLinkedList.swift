import Foundation

public class DequeDoubleLinkedList<T>: Deque {
    
    private var list = DoublyLinkedList<T>()
    
    public init(_ elements: T...) {
        for element in elements {
            list.append(element)
        }
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public func peek(from direction: Direction) -> T? {
        
        switch direction {
        case .front:
            return list.first?.value
        case .back:
            return list.last?.value
        }
    }
    
    public func enqueue(_ element: T, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            list.prepend(element)
            return true
        case .back:
            list.append(element)
            return true
        }
    }
    
    public func dequeue(from direction: Direction) -> T? {
        switch direction {
        case .front:
            if let head = list.first {
                return list.remove(head)
            }
            return nil
        case .back:
            if let tail = list.last {
                return list.remove(tail)
            }
            return nil
        }
    }
}

extension DequeDoubleLinkedList: CustomStringConvertible {
    
    public var description: String {
        String(describing: list)
    }
}
