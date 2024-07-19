import std.stdio, std.string, std.conv, std.algorithm, std.range;

immutable int INF = int.max;

class Vertex {
    int to;
    int weight;

    this(int to, int weight) {
        this.to = to;
        this.weight = weight;
    }
}

class Node {
    int id;
    Vertex[] vertexes;

    this(int id) {
        this.id = id;
        this.vertexes = [];
    }

    void applyVertexes(int[] distances, Node[] nodes) {
        foreach(Vertex v; this.vertexes) {
            // writeln("- Processing vertex to " ~ to!string(v.to) ~ " with weight of " ~ to!string(v.weight));
            // writeln("Current distance at target is: " ~ to!string(distances[v.to]));
            if(v.weight + distances[this.id] < distances[v.to]) {
                distances[v.to] = v.weight + distances[this.id];
                // writeln("Updated distance of " ~ to!string(v.to) ~ " to " ~ to!string(distances[v.to]));
                nodes[v.to].applyVertexes(distances, nodes);
            }
        }
    }
}

int[] findDistances(Node[] nodes){
    int[] distances = iota(nodes.length).map!(i => to!int(INF)).array;
    distances[0] = 0;

    foreach(Node node; nodes) {
        // writeln("-- Processing node " ~ to!string(node.id) ~ " with weight of " ~ to!string(distances[node.id]));
        node.applyVertexes(distances, nodes);
    }

    return distances;
}

void main() {
    Node[] nodes;
    int n = to!int(chomp(readln()));

    foreach(int i;0..n) {
        int[] line;
        int j = 0;

        string lineString = readln();
        foreach(string s; split(chomp(lineString)) ){ line ~= to!int(s); }
        
        Node newNode = new Node(line[j]); j++;
        int k = line[j]; j++;

        foreach(int c; 0.. k) {
            int to = line[j]; j++;
            int weight = line[j]; j++;

            newNode.vertexes ~= new Vertex(to, weight);
            
        }
        nodes ~= newNode;
    }

    // writeln("------------ PARSING HAS ENDED!!!! ------------"); 
    int[] res = findDistances(nodes);
    foreach(int i; 0..to!int(res.length)) {
        writeln(to!string(i) ~ " " ~ to!string(res[i]));
    }

}