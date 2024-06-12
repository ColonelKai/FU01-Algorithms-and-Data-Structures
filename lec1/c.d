import std.stdio, std.conv;

void main(){
    int n = to!int(readln());
    int[n] arr;
    for(i = 1; i<n; i++) {
        arr[i-1] = to!int(readln());
    }

    
}