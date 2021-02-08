import UIKit

// Challenge 1: Print an Array in Reverse Order

var intArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func printArrayInReverse<T>(array: Array<T>) {
    var stack = Stack(array)
    while let last = stack.pop() {
        print(last)
    }
}

printArrayInReverse(array: intArray)

// Challenge 2: Balance the Paranthesis

let balancedString = "h((e))llo(world)()"
let unbalancedString = "(hello world"

func isBalanced(text: String) -> Bool {
    var balanceStack = Stack<Character>()
    text.forEach {
        if $0 == "(" {
            balanceStack.push($0)
        }
        if $0 == ")" && !balanceStack.isEmpty {
            balanceStack.pop()
        }
    }
    return balanceStack.isEmpty
}

isBalanced(text: balancedString)
isBalanced(text: unbalancedString)
