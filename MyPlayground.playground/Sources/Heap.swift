import Foundation

public struct Heap<T: Equatable> {
    
    private var elements: [T] = []
    
    private let sort: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
        self.sort = sort
        self.elements = elements
        
        buildHeap()
    }
    
    private mutating func buildHeap() {
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var count: Int {
        elements.count
    }
    
    public func peek() -> T? {
        elements.first
    }
    
    public mutating func merge(_ heap: Heap) {
        elements = elements + heap.elements
        buildHeap()
    }
    
    public func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    public func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    public func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
}

extension Heap {
    
    public func index(of element: T, startingAt i: Int) -> Int? {
        
        if i >= count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
}

extension Heap {
    
    public mutating func remove(at index: Int) -> T? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    public mutating func remove() -> T? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    public mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    private mutating func siftDown(from index: Int, upTo size: Int? = nil) {
        let size = size ?? count
        var parent = index
        while true {
          let left = leftChildIndex(ofParentAt: parent)
          let right = rightChildIndex(ofParentAt: parent)
          var candidate = parent
          if left < size && sort(elements[left], elements[candidate]) {
            candidate = left
          }
          if right < size && sort(elements[right], elements[candidate]) {
            candidate = right
          }
          if candidate == parent {
            return
          }
          elements.swapAt(parent, candidate)
          parent = candidate
        }
      }
}

extension Heap {

    public func sorted() -> [T] {
        var heap = Heap(sort: sort, elements: elements)
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        return heap.elements
    }
}

extension Heap: CustomStringConvertible {
    public var description: String {
        String(describing: elements)
    }
}
