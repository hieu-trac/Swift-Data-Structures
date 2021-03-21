//: [Previous](@previous)

import Foundation

func exampleOne() {
    let beverages = TreeNode("Beverages")
    
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    
    beverages.add(hot)
    beverages.add(cold)
}

//exampleOne()

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

func exampleTwo() {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder{ print($0.value) }
    
}

func exampleThree() {
    let tree = makeBeverageTree()
    if let searchResult1 = tree.search("ginger ale") {
        print("Found node: \(searchResult1.value)")
    }
    if let searchResult2 = tree.search("WKD Blue") {
        print(searchResult2.value)
    } else {
        print("Couldn't find WKD Blue")
    }
}

/// Print a tree in level order
func challengeOne() {
    let tree = TreeNode(15)
    let one = TreeNode(1)
    let seventeen = TreeNode(17)
    let twenty = TreeNode(20)
    
    tree.add(one)
    tree.add(seventeen)
    tree.add(twenty)
    
    one.add(TreeNode(1))
    one.add(TreeNode(5))
    one.add(TreeNode(0))
    
    seventeen.add(TreeNode(2))
    
    twenty.add(TreeNode(5))
    twenty.add(TreeNode(7))
    twenty.add(TreeNode(9))

    tree.printEachLevelOrder()
}

challengeOne()

//: [Next](@next)
