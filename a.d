import std.stdio;
import std.array;
import std.conv;
import std.algorithm;
import std.string;

void countingSort(int[] A, int[] B, int k) {
    int[] C = new int[k + 1]; // Create array C with size k+1 and initialize to 0

    // Step 1: Count occurrences of each element in A
    foreach (num; A) {
        C[num]++;
    }

    // Step 2: Modify C to contain actual positions of elements in B
    for (int i = 1; i <= k; i++) {
        C[i] += C[i - 1];
    }

    // Step 3: Place elements from A into B according to the position in C
    foreach_reverse (num; A) {
        B[--C[num]] = num;
    }
}

void main() {
    int n = to!int(readln().chomp());


    // handy input reading
    int[] A = readln().strip().split.map!(to!int).array;

    int k = 10000; // maximum value in A

    // Output array B (sorted result)
    int[] B = new int[n];

    // Perform counting sort
    countingSort(A, B, k);

    // Print sorted sequence
    B.map!(to!string)
     .join(" ")
     .writeln();
}

