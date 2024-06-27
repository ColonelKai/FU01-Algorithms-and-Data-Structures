import std.stdio;
import std.algorithm;
import std.conv;
import std.array;
import std.string;

bool binarySearch(int[] array, int key) {
    int low = 0;
    int high = cast(int)array.length - 1;  // Explicitly cast array length to int

    while (low <= high) {
        int mid = (low + high) / 2;
        if (array[mid] == key) {
            return true;
        } else if (array[mid] < key) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return false;
}

void main() {
    // Reading input
    int n = to!int(readln().strip());
    int[] S = readln().strip().split.map!(to!int).array;
    int q = to!int(readln().strip());
    int[] T = readln().strip().split.map!(to!int).array;

    // Binary search to count how many numbers in T are also in S
    int C = 0;
    foreach (t; T) {
        if (binarySearch(S, t)) {
            C++;
        }
    }

    // Output the result
    writeln(C);
}
