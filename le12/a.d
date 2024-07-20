import std.stdio, std.string, std.conv, std.algorithm, std.array;

// using this to represent a vertice (vertex?), indicating both the matrix x and y,
// and also from and to nodes in that order.
class Tuple {
    int a;
    int b;

    this(int a, int b) {
        this.a = a;
        this.b = b;
    }
}

// among the valid (visited to non visited) connections, it finds the connection with least weight
Tuple getMinimumWeightIndex(int node_count, ref bool[] is_visited, int[][] weight_matrix) {
    Tuple index = new Tuple(0, 0);
    foreach (int i; 0..node_count) {
        if(!is_visited[i]) {
            continue;
        }
        foreach (int j; 0..node_count) {
            // forgive me Never Nester gods for this
            if (weight_matrix[i][j] != int.max   // If not an invalid vertice (int.max) 
            &&  weight_matrix[i][j] < weight_matrix[index.a][index.b] // and its a less weighted vertice than current min
            &&  !is_visited[j]) { // and target hasnt been visited before, probably should have put this on a line before
                                    // for optimisation but meh
                index.a = i;
                index.b = j;
            }
        }
    }
    // writeln("DEBUG: returning minimum weight index " ~ to!string(index.a) ~ to!string(index.b));

    return index;
}

int calculateTotalWeight(int node_count, int[][] weight_matrix) {
    int total_weight; //initialised at 0
    bool[] is_visited = new bool[node_count]; // list of nodes visited initalised at false
    is_visited[0] = true; // our root

    foreach(int i; 0..node_count) {
        // writeln("DEBUG: processing int i " ~ to!string(i));
        // writeln("DEBUG: total weight at " ~ to!string(total_weight));
        // writeln("DEBUG: is visited " ~ to!string(is_visited));

        Tuple min_index = getMinimumWeightIndex(node_count, is_visited, weight_matrix);
        is_visited[min_index.b] = true;
        
        // if it returns an invalid weight, we are done here.
        if(weight_matrix[min_index.a][min_index.b] == int.max) break;
            
        total_weight += weight_matrix[min_index.a][min_index.b];
    }

    return total_weight;
}

void main() {
    int node_count = to!int(chomp(readln())); 
    // I hate this
    int[][] weight_matrix = new int[][](node_count, node_count);

    foreach(int i; 0..node_count){
        int[] line = split(chomp(readln)).map!(to!int).array;
        foreach(int j; 0..node_count) {
            if(line[j] != -1)
                weight_matrix[i][j] = line[j];
            else // if its -1 we set it to god
                weight_matrix[i][j] = int.max;
        }
    }

    writeln(calculateTotalWeight(node_count, weight_matrix));        
}