//: [Previous](@previous)

import Foundation

example(of: "Graphs") {
    let graph = AdjacencyMatrix<String>()

    let singapore = graph.createVertex(data: "Singapore")
    let tokyo = graph.createVertex(data: "Tokyo")
    let hongKong = graph.createVertex(data: "Hong Kong")
    let detroit = graph.createVertex(data: "Detroit")
    let sanFrancisco = graph.createVertex(data: "San Francisco")
    let washingtonDC = graph.createVertex(data: "Washington DC")
    let austinTexas = graph.createVertex(data: "Austin Texas")
    let seattle = graph.createVertex(data: "Seattle")

    graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
    graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
    graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
    graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
    graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
    graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
    graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
    graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
    graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
    graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
    graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
    graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

    print(graph)

    print("San Francisco Outgoing Flights:")
    print("--------------------------------")
    for edge in graph.edges(from: sanFrancisco) {
        print("from: \(edge.source) to: \(edge.destination)")
    }

}

example(of: "Friends Graph") {
    let graph = AdjacencyList<String>()
    
    let vincent = graph.createVertex(data: "Vincent")
    let chesley = graph.createVertex(data: "Chesley")
    let ruiz = graph.createVertex(data: "Ruiz")
    let patrick = graph.createVertex(data: "Patrick")
    let ray = graph.createVertex(data: "Ray")
    let sun = graph.createVertex(data: "Sun")
    let cole = graph.createVertex(data: "Cole")
    let kerry = graph.createVertex(data: "Kerry")
    graph.add(.undirected, from: vincent, to: chesley)
    graph.add(.undirected, from: vincent, to: ruiz)
    graph.add(.undirected, from: vincent, to: patrick)
    graph.add(.undirected, from: ruiz, to: ray)
    graph.add(.undirected, from: ruiz, to: sun)
    graph.add(.undirected, from: patrick, to: cole)
    graph.add(.undirected, from: patrick, to: kerry)
    graph.add(.undirected, from: cole, to: ruiz)
    graph.add(.undirected, from: cole, to: vincent)
    
    print(graph)
    
    let vincentsFriends = Set(graph.edges(from: vincent).map { $0.destination.data } )
    let mutual = vincentsFriends.intersection(graph.edges(from: ruiz).map { $0.destination.data })
    
    print(mutual)
}
//: [Next](@next)
