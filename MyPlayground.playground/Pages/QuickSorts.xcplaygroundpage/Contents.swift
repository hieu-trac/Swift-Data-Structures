//: [Previous](@previous)

import Foundation

example(of: "naive quick sort") {
    
    let array = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
    print(array)
    print(quicksortNaive(array))
}

example(of: "lomuto quick sort") {
    var array = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
    print(array)
    quicksortLomuto(&array, low: 0, high: array.count - 1)
    print(array)
}

example(of: "hoare quick sort") {
    var array = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
    print(array)
    quicksortHoare(&array, low: 0, high: array.count - 1)
    print(array)
}

example(of: "median quick sort") {
    var array = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
    print(array)
    quickSortMedian(&array, low: 0, high: array.count - 1)
    print(array)
}

example(of: "dutch flag quick sort") {
    var array = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
    print(array)
    quicksortDutchFlag(&array, low: 0, high: array.count - 1)
    print(array)
}

//: [Next](@next)
