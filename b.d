import std.stdio;
import std.array;
import std.conv;
import std.algorithm;
import std.string;

// Partition(A, p, r)
// 1 x = A[r]
// 2 i = p-1
// 3 for j = p to r-1
// 4     do if A[j] <= x
// 5        then i = i+1
// 6            exchange A[i] and A[j] 
// 7 exchange A[i+1] and A[r]
// 8 return i+1


int partition(int[] A, int p, int r) {
    int x = A[r];
    int i = p - 1;
    for (int j = p; j < r; j++) {
        if (A[j] <= x) {
            i++;
            swap(A[i], A[j]);
        }
    }
    swap(A[i + 1], A[r]);
    return i + 1;
}
void main() {
    int n;
    readf("%d\n", &n);
    
    int[] A = readln().strip().split.map!(to!int).array;
    
    int pivotIndex = partition(A, 0, n - 1);
    
    foreach (i, elem; A) {
        if (i > 0) {
            write(" ");
        }
        if (i == pivotIndex) {
            write("[", elem, "]");
        } else {
            write(elem);
        }
    }
    writeln();
}
