//: [Previous](@previous)

import Foundation

example(of: "using TraversableBinaryNode") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  tree.root?.traverseInOrder { print($0) }
}

//: [Next](@next)
