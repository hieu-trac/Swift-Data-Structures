//: [Previous](@previous)

import Foundation

public struct Person: Equatable {
    let name: String
    let age: Int
    let isMilitary: Bool
}

extension Person: Comparable {
    public static func < (lhs: Person, rhs: Person) -> Bool {
        if lhs.isMilitary == rhs.isMilitary {
            return lhs.age < rhs.age
        }
        
        return !lhs.isMilitary
    }
    
    public static func > (lhs: Person, rhs: Person) -> Bool {
        if lhs.isMilitary == rhs.isMilitary {
            return lhs.age > rhs.age
        }
        
        return lhs.isMilitary
    }
}

typealias Miles = Int

public struct ChargingStation {
    let distance: Miles
    let chargeCapacity: Int
}

public enum DestinationResult {
    case reachable(rechargeStops: Int)
    case unreachable
}

example(of: "Person PriorityQueue") {
    let p1 = Person(name: "Josh", age: 21, isMilitary: true)
    let p2 = Person(name: "Jake", age: 22, isMilitary: true)
    let p3 = Person(name: "Clay", age: 28, isMilitary: false)
    let p4 = Person(name: "Cindy", age: 28, isMilitary: false)
    let p5 = Person(name: "Sabrina", age: 30, isMilitary: false)
    
    let waitlist = [p1, p2, p3, p4, p5]
    
    var priorityQueue = PriorityQueue(sort: <, elements: waitlist)
    while !priorityQueue.isEmpty {
        print(priorityQueue.dequeue()!)
    }
}

example(of: "Charging Station Travel") {
    func  minRechargeStops(target: Miles, startCharge: Int, stations: [ChargingStation]) -> DestinationResult {
        guard startCharge <= target else {
            return .reachable(rechargeStops: 0)
        }
        
        var minStops = -1
        var currentCharge = 0
        var currentStation = 0
        var chargePriority = PriorityQueue(sort: >, elements: [startCharge])
        
        while !chargePriority.isEmpty {
            guard let charge = chargePriority.dequeue() else {
                return .unreachable
            }
            
            currentCharge += charge
            
            minStops += 1
            
            if currentCharge >= target {
                return .reachable(rechargeStops: minStops)
            }
            
            while currentStation < stations.count && currentCharge >= stations[currentStation].distance {
                let distance = stations[currentStation].chargeCapacity
                _ = chargePriority.enqueue(distance)
                currentStation += 1
            }
        }
        return .unreachable
    }
    let stations = [ChargingStation(distance: 10, chargeCapacity: 60),
                    ChargingStation(distance: 20, chargeCapacity: 30),
                    ChargingStation(distance: 30, chargeCapacity: 30),
                    ChargingStation(distance: 60, chargeCapacity: 40)]
    
    minRechargeStops(target: 150, startCharge: 10, stations: stations)
}

//: [Next](@next)
