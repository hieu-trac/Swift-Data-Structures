import Foundation

public struct QueueStack<T> : Queue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    public var peek: T? {
        !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    @discardableResult public mutating func enqueue(_ element: T) -> Bool {
        enqueueStack.append(element)
        return true
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        String(describing: dequeueStack.reversed() + enqueueStack)
    }
}
