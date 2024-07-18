import std.stdio, std.string, std.conv, std.algorithm, std.range, std.math;

immutable int INF = int.max;

// void printmatrix(int[][] m) {
//     writeln("----------------");
//     foreach (i; 0..m.length) {
//         writeln(m[i]);
//     }
//     writeln("----------------");
// }

int matrix_chain_order(int[] p) {
    int n = to!int(p.length) - 1; // number of matrices
    int[][] m = new int[][](n, n);

    // Initialize diagonal elements to 0
    foreach (i; 0..n) {
        m[i][i] = 0;
    }

    // Build the table m[i][j] where i < j
    for (int l = 2; l <= n; l++) {
        for (int i = 0; i < n - l + 1; i++) {
            int j = i + l - 1;
            m[i][j] = INF;
            for (int k = i; k < j; k++) {
                int q = m[i][k] + m[k + 1][j] + p[i] * p[k + 1] * p[j + 1];
                if (q < m[i][j]) {
                    m[i][j] = q;
                }
            }
        }
    }

    return m[0][n - 1]; // Return the minimum number of operations
}

void main() {
    int n = to!int(chomp(readln())) - 1;
    int[] p;

    // Read matrix dimensions
    p ~= readln().strip.split.map!(to!int).take(2).array;

    // Read remaining dimensions
    foreach (int i; 0..n) {
        p ~= readln.strip.split.map!(to!int)[1];
    }

    writeln(matrix_chain_order(p));
}
