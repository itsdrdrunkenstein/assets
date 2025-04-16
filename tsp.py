from sys import maxsize
from itertools import permutations

V = 4  # Number of vertices

# Implementation of Traveling Salesman Problem
def travellingSalesmanProblem(graph, s):
    # Store all vertices except the source vertex
    vertex = []
    for i in range(V):
        if i != s:
            vertex.append(i)

    # Store minimum weight
    min_path = maxsize
    next_permutations = permutations(vertex)

    for perm in next_permutations:
        # Store current path weight (cost)
        current_pathweight = 0

        # Compute current path weight
        k = s
        for j in perm:
            current_pathweight += graph[k][j]
            k = j
        current_pathweight += graph[k][s]  # Return to starting point

        # Update minimum
        min_path = min(min_path, current_pathweight)

    return min_path

# Driver Code
if __name__ == "__main__":
    # Matrix representation of graph
    graph = [[0, 10, 15, 20],
             [10, 0, 35, 25],
             [15, 35, 0, 30],
             [20, 25, 30, 0]]
    s = 0
    print("Minimum cost of traveling salesman tour:", travellingSalesmanProblem(graph, s))
