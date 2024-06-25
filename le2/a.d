// BubbleSort(A)
// 1 for i = 0 to A.length-1
// 2     for j = A.length-1 downto i+1
// 3         if A[j] < A[j-1]
// 4             swap A[j] and A[j-1]
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
    
    for(auto i=0; i<arr.length; i++) {
        for(auto j = (arr.length)-1; j>i; j--) {
            if(arr[j] < arr[j-1]) {
                swap(arr[j], arr[j-1]);
                count++;
            }
        }
    }
    
    print_array(arr);
    writeln(count);

}