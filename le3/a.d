import std.stdio, std.array, std.string, std.conv, std.algorithm.mutation, std.range.primitives;

struct Stack(T) {
    const int MAX = 101;
    private T[MAX] S;
    private int top;

    // Initialize the stack
    void initialize() {
        top = -1;
    }

    // Check if the stack is empty
    bool isEmpty() {
        return top == -1;
    }

    // Check if the stack is full
    bool isFull() {
        return top >= MAX - 1;
    }

    // Push an element onto the stack
    void push(T x) {
        if (isFull()) {
            // Handle overflow error (throwing an exception in D)
            throw new Exception("Stack overflow");
        }
        S[++top] = x;
    }

    // Pop an element from the stack and return it
    T pop() {
        if (isEmpty()) {
            // Handle underflow error (throwing an exception in D)
            throw new Exception("Stack underflow");
        }
        return S[top--];
    }

    T read(int index) {
        if (index < 0 || index > top) {
            throw new Exception("Index out of bounds");
        }
        return S[index];
    }

    int getTop() {
        return top;
    }
}

void main() {

    auto line = readln();
    Stack!int stack;
    foreach (token; line.split)    {
        if(isNumeric(token)){
            stack.push(to!int(token));
            continue;
        }
        else {
            int b = stack.pop();
            int a = stack.pop();

            switch(token) {
                case("+"):
                    stack.push(a + b);
                    break;
                case("-"):
                    stack.push(a - b);
                    break;
                case("*"):
                    stack.push(a * b);
                    break;
                default:
                    break;
            }
        }
    }



    writeln(stack.pop());

}