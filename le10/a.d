import std.stdio, std.string, std.conv;

int fibo_my_nichi(int x, int[] memo) { 
    if(!memo[x] is 0) { return memo[x]; } 
    return memo[x] = (fibo_my_nichi(x-1, memo) + fibo_my_nichi(x-2, memo)); } 
    
    
void main() { 
    int x = to!int(chomp(readln()));
    int[] memo = new int[x + 1];
    memo[0] = 1;
    memo[1] = 1;
    writeln(fibo_my_nichi(x, memo));     
    }