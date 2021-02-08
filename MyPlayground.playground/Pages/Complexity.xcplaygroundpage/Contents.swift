//: [Previous](@previous)

import Foundation

let value = 1_000_000

@discardableResult func sumFromOneA(upto n: Int) -> Int {
  var result = 0
  for i in 1...n {
    result += i
  }
  return result
}
evaluatePerformance() {
    sumFromOneA(upto: value)
}


@discardableResult func sumFromOneB(upto n: Int) -> Int {
  (1...n).reduce(0, +)
}
evaluatePerformance() {
    sumFromOneB(upto: value)
}


@discardableResult func sumFromOneC(upto n: Int) -> Int {
  (n + 1) * n / 2
}
evaluatePerformance() {
    sumFromOneC(upto: value)
}


//: [Next](@next)
