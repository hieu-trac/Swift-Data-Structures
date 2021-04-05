import Foundation

public class Prim<T: Hashable> {
    
    public typealias Graph = AdjacencyList<T>
    public init() {}
    
    internal func addAvailableEdges(
        for vertex: Vertex<T>,
        in graph: Graph,
        check visited: Set<Vertex<T>>,
        to priorityQueue: inout PriorityQueue<Edge<T>>) {
        for edge in graph.edges(from: vertex) { // 1
            if !visited.contains(edge.destination) { // 2
                priorityQueue.enqueue(edge) // 3
            }
        }
    }
    
    public func produceMinimumSpanningTree(for graph: Graph) -> (cost: Double, mst: Graph) {
        var cost = 0.0
        let mst = Graph()
        var visited: Set<Vertex<T>> = []
        var priorityQueue = PriorityQueue<Edge<T>>(sort: {
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        })

        mst.copyVertices(from: graph)
        
        guard let start = graph.allVertices.first else {
            return (cost: cost, mst: mst)
        }
        
        visited.insert(start)
        addAvailableEdges(for: start, in: graph, check: visited, to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            let vertex = smallestEdge.destination
            guard !visited.contains(vertex) else {
                continue
            }
            
            visited.insert(vertex)
            cost += smallestEdge.weight ?? 0.0
            
            mst.add(.undirected, from: smallestEdge.source, to: smallestEdge.destination, weight: smallestEdge.weight)
            
            addAvailableEdges(for: vertex, in: graph, check: visited, to: &priorityQueue)
        }
        
        return (cost: cost, mst: mst)
    }
}
