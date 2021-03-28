import Foundation

extension MutableCollection where Element: Comparable {
    public mutating func bubbleSort() {

        guard count >= 2 else { return }
        
        for end in indices.reversed() {
            var swapped = false
            var current = startIndex
            while current < end {
                let next = index(after: current)
                if self[current] > self[next] {
                    swapAt(current, next)
                    swapped = true
                }
                current = next
            }
            if !swapped {
                return
            }
        }
    }
    
    public mutating func selectionSort() {
        
        guard count >= 2 else { return }
        
        for current in indices {
            var lowest = current
            var other = index(after: current)
            while other < endIndex {
                if self[lowest] > self[other] {
                    lowest = other
                }
                other = index(after: other)
            }
            if lowest != current {
                swapAt(lowest, current)
            }
        }
    }
}

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {
    
    public mutating func insertionSort() {
        
        guard count >= 2 else { return }
        
        for current in indices {
            var shifting = current
            while shifting > startIndex {
                let previous = index(before: shifting)
                if self[shifting] < self[previous] {
                    swapAt(shifting, previous)
                } else {
                    break
                }
                shifting = previous
            }
        }
    }
}

extension MutableCollection where Self: BidirectionalCollection {
    
    public mutating func reverse() {
        var left = startIndex
        var right = index(before: endIndex)
        
        while left < right {
            swapAt(left, right)
            formIndex(after: &left)
            formIndex(before: &right)
        }
    }
}
