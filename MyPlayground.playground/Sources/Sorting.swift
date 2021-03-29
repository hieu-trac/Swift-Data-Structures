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

extension Array where Element == Int {
    
    private var maxDigits: Int {
        self.max()?.digits ?? 0
    }
    
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            
            forEach { number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                
                if remainingPart > 0 {
                    done = false
                }
            }
            
            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
    
    public mutating func lexicographicalSort() {
        self = msdRadixSorted(self, 0)
    }
    
    private func msdRadixSorted(_ array: [Int], _ position: Int) -> [Int] {
        
        guard position < array.maxDigits else {
            return array
        }
        
        var buckets: [[Int]] = .init(repeating: [], count: 10)
        var priorityBucket: [Int] = []
        
        array.forEach { number in
            guard let digit = number.digit(atPosition: position) else {
                priorityBucket.append(number)
                return
            }
            buckets[digit].append(number)
        }
        
        priorityBucket.append(contentsOf: buckets.reduce(into: []) { result, bucket in
            guard !bucket.isEmpty else { return }
            result.append(contentsOf: msdRadixSorted(bucket, position + 1))
        })
        
        return priorityBucket
    }
}

extension Int {
    var digits: Int {
        var count = 0
        var num = self
        while num != 0 {
            count += 1
            num /= 10
        }
        return count
    }
    
    func digit(atPosition position: Int) -> Int? {
        
        guard position < digits else {
            return nil
        }
        
        var num = self
        let correctedPosition = Double(position + 1)
        while num / Int(pow(10.0, correctedPosition)) != 0 {
            num /= 10
        }
        return num % 10
    }
}
