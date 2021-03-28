//: [Previous](@previous)

import Foundation

example(of: "Get nth smallest using Heap") {
    
    func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
        var heap = Heap(sort: <, elements: elements)
        var current = 1
        while !heap.isEmpty {
            let element = heap.remove()
            if current == n {
                return element
            }
            current += 1
        }
        return nil
    }
    
    let integers = [3, 10, 18, 5, 21, 100]
    
    getNthSmallestElement(n: 3, elements: integers)
}

example(of: "Merge Heap") {
    
    var heap1 = Heap(sort: <, elements: [3, 10, 18, 5, 21, 100])
    let heap2 = Heap(sort: <, elements: [21, 10, 18, 5, 3, 100, 1])
    print(heap1)
    print(heap2)
    
    heap1.merge(heap2)
    
    print(heap1)
}

example(of: "Is Min Heap") {
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func isMinHeap<T: Comparable>(elements: [T]) -> Bool {
        guard !elements.isEmpty else {
            return true
        }
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            let left = leftChildIndex(ofParentAt: i)
            let right = rightChildIndex(ofParentAt: i)
            if elements[left] < elements[i] {
                return false
            }
            if right < elements.count && elements[right] < elements[i] {
                return false
            }
        }
        return true
    }
    
    isMinHeap(elements: [3, 10, 18, 5, 21, 100])
    isMinHeap(elements: [21, 10, 18, 5, 3, 100, 1])
    isMinHeap(elements: [3, 5, 18, 10, 21, 100])
    isMinHeap(elements: [1, 3, 18, 5, 10, 100, 21])
    isMinHeap(elements: [1, 3, 3, 5, 5, 21, 18, 10, 18, 21, 10, 100, 100])
}

//: [Next](@next)
