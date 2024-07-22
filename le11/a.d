import std.stdio;
import std.array;
import std.string;
import std.conv; // For to!string

void main() {
    // Read number of vertices
    int n = stdin.readln.strip.to!int;

    // Initialize adjacency matrix with all zeros
    int[][] adjacencyMatrix = new int[][](n, n);

    // Read adjacency list
    foreach (i; 0 .. n) {
        auto line = stdin.readln.strip.split;
        int u = line[0].to!int - 1; // Vertex ID (adjusted for 0-based index)
        int k = line[1].to!int; // Number of adjacent vertices
        foreach (j; 0 .. k) {
            int v = line[2 + j].to!int - 1; // Adjacent vertex ID (adjusted for 0-based index)
            adjacencyMatrix[u][v] = 1;
        }
    }

    // Print adjacency matrix without trailing whitespace
    foreach (i; 0 .. n) {
        writeln(adjacencyMatrix[i].map!(x => x.to!string).join(" "));
    }
}
