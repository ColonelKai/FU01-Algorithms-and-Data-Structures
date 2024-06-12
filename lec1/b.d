import std.stdio;


void main(){
    int a, b; // read input
    readf("%d %d", &a, &b);

    int R; // euclidian GCD
    while ((a % b) > 0)  {
        R = a % b;
        a = b;
        b = R;
    }

    writef("%d\n",b);
}