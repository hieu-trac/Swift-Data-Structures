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

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    guard array.count > 1 else { return array }
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
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

example(of: "merge sort") {
    let array = [7, 2, 6, 3, 9]
    print("Original: \(array)")
    print("Merge sorted: \(mergeSort(array))")
}

example(of: "challenge 1") {
    let size = 1024
    var values: [Int] = []
    values.reserveCapacity(size)
    // 1
    for i in 0 ..< size {
        values.append(i)
    }
}

func merge<T: Sequence>(first: T, second: T) -> AnySequence<T.Element> where T.Element: Comparable {
    
    var result: [T.Element] = []
    
    var firstIterator = first.makeIterator()
    var secondIterator = second.makeIterator()
    
    var firstNextValue = firstIterator.next()
    var secondNextValue = secondIterator.next()
    
    while let first = firstNextValue, let second = secondNextValue {
        
        if first < second {
            result.append(first)
            firstNextValue = firstIterator.next()
        } else if second < first {
            result.append(second)
            secondNextValue = secondIterator.next()
        } else {
            result.append(first)
            result.append(second)
            firstNextValue = firstIterator.next()
            secondNextValue = secondIterator.next()
        }
    }
    
    while let first = firstNextValue {
        result.append(first)
        firstNextValue = firstIterator.next()
    }
    
    while let second = secondNextValue {
        result.append(second)
        secondNextValue = secondIterator.next()
    }
    
    return AnySequence<T.Element>(result)
}

example(of: "challenge 2") {

    let array1 = [1, 2, 3, 4, 5, 6, 7, 8]
    let array2 = [1, 3, 4, 5, 5, 6, 7, 7]
    
    for element in merge(first: array1, second: array2) {
        print(element)
    }
}
//: [Next](@next)
