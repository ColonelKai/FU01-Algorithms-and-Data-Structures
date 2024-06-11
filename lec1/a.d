// for i = 1 to A.length-1
//     key = A[i]
//     /* insert A[i] into the sorted sequence A[0,...,j-1] */
//     j = i - 1
//     while j >= 0 and A[j] > key
//         A[j+1] = A[j]
//         j--
//     A[j+1] = key

void main() {
    import std.stdio, std.array, std.conv;


    writeln("write line1");
    auto line1 = readln();
    auto line2 = readln();

    // parse line 1
    int n = toInt(line1);

    write(line1);
    write(line2);
}