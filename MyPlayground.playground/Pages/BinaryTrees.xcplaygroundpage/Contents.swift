//: [Previous](@previous)

import Foundation

var exampleTree: BinarySearchTree<Int> {
  var bst = BinarySearchTree<Int>()
  bst.insert(3)
  bst.insert(1)
  bst.insert(4)
  bst.insert(0)
  bst.insert(2)
  bst.insert(5)
  return bst
}

var tree1  = exampleTree
//tree1.remove(3)
var tree2 = exampleTree
tree2.remove(3)

tree1.contains(tree2)

//: [Next](@next)
