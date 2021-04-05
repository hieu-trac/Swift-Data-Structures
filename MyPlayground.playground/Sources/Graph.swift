import Foundation

public enum EdgeType {
    
    case directed
    case undirected
}

public protocol Graph {
    
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    var allVertices: [Vertex<Element>] { get }
}

public extension Graph {
    
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double? = nil) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double? = nil) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

public extension Graph where Element: Hashable {
    
    func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        var numberOfPaths = 0
        var visited: Set<Vertex<Element>> = []
        paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)
        
        return numberOfPaths
    }
    
    private func paths(from source: Vertex<Element>, to destination: Vertex<Element>, visited: inout Set<Vertex<Element>>, pathCount: inout Int) {
        visited.insert(source)
        if source == destination {
            pathCount += 1
        } else {
            let neighbors = edges(from: source)
            for edge in neighbors {
                if !visited.contains(edge.destination) {
                    paths(from: edge.destination, to: destination, visited: &visited, pathCount: &pathCount)
                }
            }
        }
        
        visited.remove(source)
    }
    
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        
        return visited
    }
    
    func breadthFirstSearchRecursive(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
        
        return visited
    }
    
    private func bfs(queue: inout QueueStack<Vertex<Element>>, enqueued: inout Set<Vertex<Element>>, visited: inout [Vertex<Element>]) {
        guard let vertex = queue.dequeue() else { return }
        
        visited.append(vertex)
        
        let neighborEdges = edges(from: vertex)
        neighborEdges.forEach { edge in
            if !(enqueued.contains((edge.destination))) {
                queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)
            }
        }
        bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
    }
}
