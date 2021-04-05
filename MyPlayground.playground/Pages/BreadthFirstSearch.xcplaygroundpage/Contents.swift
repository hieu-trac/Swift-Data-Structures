//: [Previous](@previous)

import Foundation

example(of: "Breadth-First Search") {
    let graph = AdjacencyList<String>()
    
    let a = graph.createVertex(data: "A")
    let b = graph.createVertex(data: "B")
    let c = graph.createVertex(data: "C")
    let d = graph.createVertex(data: "D")
    let e = graph.createVertex(data: "E")
    let f = graph.createVertex(data: "F")
    let g = graph.createVertex(data: "G")
    let h = graph.createVertex(data: "H")
    
    graph.add(.undirected, from: a, to: b)
    graph.add(.undirected, from: a, to: c)
    graph.add(.undirected, from: a, to: d)
    graph.add(.undirected, from: b, to: e)
    graph.add(.undirected, from: c, to: f)
    graph.add(.undirected, from: c, to: g)
    graph.add(.undirected, from: e, to: h)
    graph.add(.undirected, from: e, to: f)
    graph.add(.undirected, from: f, to: g)
    
    print(graph)
    
    let vertices = graph.breadthFirstSearch(from: a)
    vertices.forEach { vertex in
        print(vertex)
    }
}

example(of: "Recursive BFS") {
    let graph = AdjacencyList<String>()
    
    let a = graph.createVertex(data: "A")
    let b = graph.createVertex(data: "B")
    let c = graph.createVertex(data: "C")
    let d = graph.createVertex(data: "D")
    let e = graph.createVertex(data: "E")
    let f = graph.createVertex(data: "F")
    let g = graph.createVertex(data: "G")
    let h = graph.createVertex(data: "H")
    
    graph.add(.undirected, from: a, to: b)
    graph.add(.undirected, from: a, to: c)
    graph.add(.undirected, from: a, to: d)
    graph.add(.undirected, from: b, to: e)
    graph.add(.undirected, from: c, to: f)
    graph.add(.undirected, from: c, to: g)
    graph.add(.undirected, from: e, to: h)
    graph.add(.undirected, from: e, to: f)
    graph.add(.undirected, from: f, to: g)
    
    print(graph)
    
    let vertices = graph.breadthFirstSearchRecursive(from: a)
    vertices.forEach { vertex in
        print(vertex)
    }
}


extension Graph where Element: Hashable {
    
    func isDisconnected() -> Bool {
        
        let sortVertex: (Vertex<Element>, Vertex<Element>) -> Bool = { (v1, v2) -> Bool in
            v1.index < v2.index
        }
        
        guard let first = allVertices.first else { return false }
        
        let firstVerticies = breadthFirstSearch(from: first).sorted(by: sortVertex)
        
        return firstVerticies != allVertices.sorted(by: sortVertex)
    }
}

example(of: "Is Disconnected") {
    let graph = AdjacencyList<String>()
    let a = graph.createVertex(data: "A")
    let b = graph.createVertex(data: "B")
    let c = graph.createVertex(data: "C")
    let d = graph.createVertex(data: "D")
    let e = graph.createVertex(data: "E")
    let f = graph.createVertex(data: "F")
    let g = graph.createVertex(data: "G")
    let h = graph.createVertex(data: "H")
    
    graph.add(.undirected, from: a, to: b)
    graph.add(.undirected, from: a, to: c)
    graph.add(.undirected, from: a, to: d)
    graph.add(.undirected, from: e, to: h)
    graph.add(.undirected, from: e, to: f)
    graph.add(.undirected, from: f, to: g)
    
    graph.isDisconnected()
    
    // Add the following connection to connect the graphs
    graph.add(.undirected, from: a, to: e)
    graph.isDisconnected()
}

//: [Next](@next)
