//: [Previous](@previous)

import Foundation

protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

typealias Player = String

struct MonopolyOrganizer: BoardGameManager {
    private var playerQueue = QueueLinkedList<Player>()
    
    init(_ players: Player...) {
        for player in players {
            playerQueue.enqueue(player)
        }
    }
    
    mutating func nextPlayer() -> Player? {
        guard let next = playerQueue.dequeue() else { return nil }
        playerQueue.enqueue(next)
        return next
    }
}

/// Create a Monopoly organizer that always tells you whose turn it is. Below is a protocol that you can conform to protocol BoardGameManager
func challengeThree() {
    var organizer = MonopolyOrganizer("Hieu", "Kristy", "Emilie", "Kaitlin", "Adalyn")
    organizer.nextPlayer()
    organizer.nextPlayer()
    organizer.nextPlayer()
    organizer.nextPlayer()
    organizer.nextPlayer()
    organizer.nextPlayer()
}

//challengeThree()

extension QueueArray {
    
    func reversed() -> QueueArray {
        var queue = self
        
        var stack = Stack<T>()
        
        while let item = queue.dequeue() {
            stack.push(item)
        }
        
        while let item = stack.pop() {
            queue.enqueue(item)
        }
        
        return queue
    }
}

/// Implement a method to reverse the contents of a queue.
func challengeFour() {
    
    var myQueue  = QueueArray<String>()
    myQueue.enqueue("Hieu")
    myQueue.enqueue("Kristy")
    myQueue.enqueue("Emilie")
    myQueue.enqueue("Kaitlin")
    myQueue.enqueue("Adalyn")
    myQueue
    myQueue.reversed()
}

func challengeFive() {
    
    let deque = DequeDoubleLinkedList<Int>()
    deque.enqueue(1, to: .back)
    deque.enqueue(2, to: .back)
    deque.enqueue(3, to: .back)
    deque.enqueue(4, to: .back)

    print(deque)

    deque.enqueue(5, to: .front)

    print(deque)

    deque.dequeue(from: .back)
    deque.dequeue(from: .back)
    deque.dequeue(from: .back)
    deque.dequeue(from: .front)
    deque.dequeue(from: .front)
    deque.dequeue(from: .front)
    
    print(deque)
}

challengeFive()

//: [Next](@next)
