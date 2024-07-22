import std.stdio;
import std.array;
import std.string;
import std.conv;
import std.algorithm;

void DFSVisit(int u, ref int[][] adj, ref bool[] visited, ref int[] discoverTime, ref int[] finishTime, ref int time) {
    time++;
    discoverTime[u] = time;
    visited[u] = true;
    
    foreach (v; adj[u]) {
        if (!visited[v]) {
            DFSVisit(v, adj, visited, discoverTime, finishTime, time);
        }
    }
    
    time++;
    finishTime[u] = time;
}

void DFS(int n, int[][] adj, ref int[] discoverTime, ref int[] finishTime) {
    bool[] visited = new bool[n];
    int time = 0;

    for (int u = 0; u < n; u++) {
        if (!visited[u]) {
            DFSVisit(u, adj, visited, discoverTime, finishTime, time);
        }
    }
}

void main() {
    // Read number of vertices
    int n = stdin.readln.strip.to!int;

    // Initialize adjacency list
    int[][] adj = new int[][](n);

    // Read adjacency list
    foreach (i; 0 .. n) {
        auto line = stdin.readln.strip.split;
        int u = line[0].to!int - 1; // Vertex ID (adjusted for 0-based index)
        int k = line[1].to!int; // Number of adjacent vertices
        adj[u] = new int[](k);
        foreach (j; 0 .. k) {
            adj[u][j] = line[2 + j].to!int - 1; // Adjacent vertex ID (adjusted for 0-based index)
        }
    }

    // Prepare discovery and finish time arrays
    int[] discoverTime = new int[](n);
    int[] finishTime = new int[](n);

    // Perform DFS
    DFS(n, adj, discoverTime, finishTime);

    // Print results
    for (int i = 0; i < n; i++) {
        writefln("%d %d %d", i + 1, discoverTime[i], finishTime[i]);
    }
}
