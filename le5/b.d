import std.stdio, std.array, std.algorithm, std.range, std.conv, std.string;

int comparisons = 0;

// Function to merge two subarrays
void merge(int[] A, int left, int mid, int right) {
    int n1 = mid - left;
    int n2 = right - mid;

    int[] L = A[left .. mid];
    int[] R = A[mid .. right];

    // Sentinel values
    L ~= int.max; 
    R ~= int.max; 

    int i = 0, j = 0;
    for (int k = left; k < right; k++) {
        if (L[i] <= R[j]) {
            A[k] = L[i];
            i++;
        } else {
            A[k] = R[j];
            j++;
        }
        comparisons++;
    }
}

// Function to perform merge sort
void mergeSort(int[] A, int left, int right) {
    if (left + 1 < right) {
        int mid = (left + right) / 2;
        mergeSort(A, left, mid);
        mergeSort(A, mid, right);
        merge(A, left, mid, right);
    }
}

void main() {
    // Read input
    auto n = chomp(readln()).to!int;
    auto A = chomp(readln()).split(' ').map!(a => a.to!int).array;

    // Perform merge sort
    mergeSort(A, 0, to!int(A.length));


    // Print sorted array
    writeln(A.map!(a => to!string(a)).array.join(" "));
    // Print the number of comparisons
    writeln(comparisons);
}