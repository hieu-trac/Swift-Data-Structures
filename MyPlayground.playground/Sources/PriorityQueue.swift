import Foundation

public struct PriorityQueue<T: Equatable>: Queue {
    
    private var heap: Heap<T>
    
    public init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    public var isEmpty: Bool {
        heap.isEmpty
    }
    
    public var peek: T? {
        heap.peek()
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        heap.insert(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        heap.remove()
    }
}
