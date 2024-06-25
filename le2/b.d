// SelectionSort(A)
// 1 for i = 0 to A.length-1
// 2     mini = i
// 3     for j = i to A.length-1
// 4         if A[j] < A[mini]
// 5             mini = j
// 6     swap A[i] and A[mini]
import std.stdio, std.string, std.conv, std.array, std.algorithm;

void print_array(int[] array){
    array.map!(to!string)
     .join(" ")
     .writeln();
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
    
    int count = 0;

    // Ensure the length of the array matches n
    assert(arr.length == n, "Number of elements in the array does not match n");
    
    for(auto i=0; i<arr.length; i++){
        auto mini = i;
        for(auto j=i; j<arr.length; j++) {
            if(arr[j] < arr[mini]) {
                mini = j;
            }
        }
        if(arr[i] != arr[mini]){
            swap(arr[i], arr[mini]);
            count++;
        }
    }
    
    print_array(arr);
    writeln(count);

}