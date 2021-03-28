import Foundation

public struct PriorityQueueArray<T: Equatable>: Queue {
    
    private var elements: [T] = []
    let sort: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
        self.sort = sort
        self.elements = elements
        self.elements.sort(by: sort)
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var peek: T? {
        elements.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        for (index, otherElement) in elements.enumerated() {
            if sort(element, otherElement) {
                elements.insert(element, at: index)
                return true
            }
        }
        elements.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : elements.removeFirst()
    }
}

extension PriorityQueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: elements)
    }
}
