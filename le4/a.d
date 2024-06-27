import std.stdio;
import std.array;
import std.algorithm;
import std.conv;
import std.string;

bool linearSearch(int[] array, int key) {
    foreach (element; array) {
        if (element == key) {
            return true;
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
    
    // Linear search to count how many numbers in T are also in S
    int C = 0;
    foreach (t; T) {
        if (linearSearch(S, t)) {
            C++;
        }
    }
    
    // Output the result
    writeln(C);
}
