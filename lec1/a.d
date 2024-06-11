// for i = 1 to A.length-1
//     key = A[i]
//     /* insert A[i] into the sorted sequence A[0,...,j-1] */
//     j = i - 1
//     while j >= 0 and A[j] > key
//         A[j+1] = A[j]
//         j--
//     A[j+1] = key
import std.stdio;
import std.conv;
import std.array;
import std.string;

void print_array(int[] array){
    foreach(i; array){
        writef("%d ", i);
    } printf("\n");
}

void main()
{
    // Read the first line (integer n)
    auto line1 = readln().chomp();
    int n = to!int(line1);
    // Read the second line (array of integers)
    auto line2 = readln();
    int[] arr;
    foreach (token; line2.split)    {
        arr ~= to!int(token);
    }
    
    // Ensure the length of the array matches n
    assert(arr.length == n, "Number of elements in the array does not match n");
    
    // print initial state
    print_array(arr);


    // implement pseudocode
    for(int i = 0; i<n; i++) {
        int curr = arr[i];
        int j = i - 1;
        while(j >= 0 && arr[j] > curr) {
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = curr;
        print_array(arr);
    }
}