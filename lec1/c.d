import std.stdio, std.conv, std.math, std.string;

void main(){
    int n = to!int(strip(readln()));
    int[] arr = new int[n];
    for(int i = 0; i<n; i++) {
        auto temp = strip(readln());
        arr[i] = to!int(temp);
    }

    int count = n;

    assert(n == arr.length, "Array length given N does not match actual array length.");

    foreach(number;arr) {
        for(int j=2; j<=sqrt(to!float(number));j++) {
            if(number%j==0 && number != 2){
                count--;
                break;
            }
        } 
        
    }

    writeln(to!string(count));

    
}