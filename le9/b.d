module le9.b;

import std.stdio;
import std.algorithm, std.array;
import std.conv;
import std.string;

void maxHeapify(int[] A, int i, int H) {
    int left(int i) { return 2 * i; }
    int right(int i) { return 2 * i + 1; }

    int l = left(i);
    int r = right(i);
    int largest;

    if (l <= H && A[l - 1] > A[i - 1])
        largest = l;
    else
        largest = i;

    if (r <= H && A[r - 1] > A[largest - 1])
        largest = r;

    if (largest != i) {
        swap(A[i - 1], A[largest - 1]);
        maxHeapify(A, largest, H);
    }
}

void buildMaxHeap(int[] A, int H) {
    for (int i = H / 2; i >= 1; i--) {
        maxHeapify(A, i, H);
    }
}

void main() {
    // Read the input
    string line1 = chomp(readln());
    int H = to!int(line1);

    string line2 = chomp(readln());
    int[] A = line2.split().map!(to!int).array();

    // Build the max-heap
    buildMaxHeap(A, H);

    // Print the result
    foreach (value; A) {
        write(" ", value);
    }
    writeln();
}
