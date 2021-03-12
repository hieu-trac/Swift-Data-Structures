import Foundation

public struct QueueArray<T>: Queue {
    private var storage: [T] = []
    
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        storage.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : storage.removeFirst()
    }
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    public var peek: Element? {
        storage.first
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: storage)
    }
}
