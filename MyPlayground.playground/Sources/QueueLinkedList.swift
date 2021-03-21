import Foundation

public class QueueLinkedList<T>: Queue {
    private var storage = DoublyLinkedList<T>()
    
    public init() {}
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    public var peek: T? {
        storage.first?.value
    }
    
    @discardableResult public func enqueue(_ element: T) -> Bool {
        storage.append(element)
        return true
    }
    
    @discardableResult public func dequeue() -> T? {
        guard !storage.isEmpty, let element = storage.first else {
            return nil
        }
        return storage.remove(element)
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: storage)
    }
}
