import std.stdio;
import std.conv;
import std.string;
import std.array;

class Node {
    int key;
    Node left;
    Node right;
    Node p;

    this(int key) {
        this.key = key;
        this.left = null;
        this.right = null;
        this.p = null;
    }
}

class BinarySearchTree {
    Node root = null;

    void insert(int key) {
        Node z = new Node(key);
        Node y = null;
        Node x = root;

        while (x !is null) {
            y = x;
            if (z.key < x.key) {
                x = x.left;
            } else {
                x = x.right;
            }
        }

        z.p = y;

        if (y is null) {
            root = z;
        } else if (z.key < y.key) {
            y.left = z;
        } else {
            y.right = z;
        }
    }

    void inorderTreeWalk(Node x, ref string[] result) {
        if (x !is null) {
            inorderTreeWalk(x.left, result);
            result ~= [to!string(x.key)]; // Append key to result array
            inorderTreeWalk(x.right, result);
        }
    }

    void preorderTreeWalk(Node x, ref string[] result) {
        if (x !is null) {
            result ~= [to!string(x.key)]; // Append key to result array
            preorderTreeWalk(x.left, result);
            preorderTreeWalk(x.right, result);
        }
    }

    void print() {
        string[] inorderResult;
        string[] preorderResult;

        inorderTreeWalk(root, inorderResult);
        preorderTreeWalk(root, preorderResult);

        writeln(" " ~ join(inorderResult, " "));
        writeln(" " ~ join(preorderResult, " "));
    }
}

void main() {
    auto bst = new BinarySearchTree();
    int m = to!int(chomp(readln()));

    foreach (i; 0 .. m) {
        string text = chomp(readln());
        string cmd = text.split(" ")[0];
        int key = text.split(" ").length > 1 ? to!int(text.split(" ")[1]) : 0;

        if (cmd == "insert") {
            bst.insert(key);
        } else if (cmd == "print") {
            bst.print();
        }
    }
}

