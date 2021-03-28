//: [Previous](@previous)

import Foundation

extension MutableCollection where Self: BidirectionalCollection, Element: Equatable {
    
    public mutating func rightAlign(value: Element) {
        var left = startIndex
        var right = index(before: endIndex)
        
        while left < right {
            while self[right] == value {
                formIndex(before: &right)
            }
            while self[left] != value {
                formIndex(after: &left)
            }
            
            guard left < right else {
                return
            }
            
            swapAt(left, right)
        }
    }
}

extension Sequence where Element: Hashable {
    public var firstDuplicate: Element? {
        var found: Set<Element> = []
        for value in self {
            if found.contains(value) {
                return value
            } else {
                found.insert(value)
            }
        }
        return nil
    }
}

example(of: "bubble sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    array.bubbleSort()
    print("Bubble sorted: \(array)")
}

example(of: "selection sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    array.selectionSort()
    print("Selection sorted: \(array)")
}

example(of: "insertion sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    array.insertionSort()
    print("Insertion sorted: \(array)")
}

example(of: "right align") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    array.rightAlign(value: 9)
    print("right align array value: \(array)")
}

example(of: "first duplicate") {
    let array = [9, 4, 10, 3, 4]
    print(String(describing: array.firstDuplicate))
}

example(of: "reverse") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    array.reverse()
    print("Reverse: \(array)")
}

//: [Next](@next)
