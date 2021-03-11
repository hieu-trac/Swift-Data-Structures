//: [Previous](@previous)

import Foundation

/// Create a function that prints the nodes of a linked list in reverse order
func challengeOne() {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    list1.append(3)
    list1.append(4)
    print("List1: \(list1)")

    // Challenge 1: Print in reverse

    func printInReverse<T>(node: Node<T>?) {
        guard let node = node else { return }
        
        printInReverse(node: node.next)
        
        print(node.value)
    }

    printInReverse(node: list1.head)
}

/// Create a function that finds the middle node of a linked list
func challengeTwo() {
    var list1 = LinkedList<Int>()
    list1.append(0)
    list1.append(1)
    list1.append(2)
    list1.append(3)
    list1.append(4)
    list1.append(5)
    print("List1: \(list1)")
    
    var normal = list1.head
    var fast = list1.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        normal = normal?.next
    }
    
    if let n = normal {
        print(n)
    }
}

/// Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
func challengeThree() {
    var list1 = LinkedList<Int>()
    list1.append(0)
    list1.append(1)
    list1.append(2)
    list1.append(3)
    list1.append(4)
    list1.append(5)
    
    print("List1: \(list1)")
    
    list1.reverseComplex()
    
    print("List1: \(list1)")
}

/// Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
func challengeFour() {
    var list1 = LinkedList<Int>()
    list1.push(3)
    list1.push(2)
    list1.push(1)
    /*
    list1.append(1)
    list1.append(4)
    list1.append(10)
    list1.append(11)
*/
    var list2 = LinkedList<Int>()
    list2.push(-1)
    list2.push(-2)
    list2.push(-3)
    /*
    list2.append(-1)
    list2.append(2)
    list2.append(3)
    list2.append(6)
*/
    var mergedList = LinkedList<Int>()
    
    var cursor1 = list1.head
    var cursor2 = list2.head
    
    while let value1 = cursor1?.value, let value2 = cursor2?.value {
        if value1 < value2 {
            mergedList.append(value1)
            cursor1 = cursor1?.next
        } else {
            mergedList.append(value2)
            cursor2 = cursor2?.next
        }
    }
    
    if let value1 = cursor1 {
        mergedList.tail?.next = value1
    }
    
    if let value2 = cursor2 {
        mergedList.tail?.next = value2
    }
    
    print("Merged list: \(mergedList)")
}

/// Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
func challengeFive() {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(2)
    list.push(3)
    list.push(3)
    list.push(3)
    list.push(1)
    list.push(1)
    list.push(3)
    
    list.removeAll(3)
    print(list)
}

//challengeOne()
//challengeTwo()
//challengeThree()
//challengeFour()
challengeFive()

//: [Next](@next)
