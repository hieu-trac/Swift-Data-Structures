//: [Previous](@previous)

import Foundation

example(of: "Depth-First Search") {
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
    
    let vertices = graph.depthFirstSearchRecursive(from: a)
    vertices.forEach { vertex in
        print(vertex)
    }
}
//: [Next](@next)
