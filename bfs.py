from collections import defaultdict
from collections import deque

# This class represents a directed graph using adjacency list representation
class Graph:
    # Constructor
    def __init__(self):
        # default dictionary to store graph
        self.graph = defaultdict(list)

    # Function to add an edge to the graph
    def addEdge(self, u, v):
        self.graph[u].append(v)

    # Function to print a BFS of graph starting from vertex s
    def BFS(self, s):
        # Create a set of all nodes to determine the size for visited array
        all_nodes = set(self.graph.keys())
        for adj in self.graph.values():
            all_nodes.update(adj)

        visited = {node: False for node in all_nodes}

        # Create a queue for BFS
        queue = deque()

        # Mark the source node as visited and enqueue it
        queue.append(s)
        visited[s] = True

        while queue:
            # Dequeue a vertex from queue and print it
            vertex = queue.popleft()
            print(vertex, end=" ")

            # Get all adjacent vertices of the dequeued vertex
            for i in self.graph[vertex]:
                if not visited[i]:
                    queue.append(i)
                    visited[i] = True

# Driver code
g = Graph()
g.addEdge(0, 1)
g.addEdge(0, 2)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(2, 3)
g.addEdge(3, 3)

print("Following is Breadth First Traversal (starting from vertex 2):")
g.BFS(2)
