import std.stdio;
import std.conv;
import std.string;
import std.array;

class NodeQueue {
  Node[] arr;
  
  void enqueue(Node node) {
    arr ~= node;
  }
  
  Node dequeue() {
    Node ret = arr[0];
    arr = arr[1 .. $];
    return ret;
  }
  
  bool isEmpty() { return  !(arr.length > 0);}
}

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

class CompleteBinaryTree {
    Node root = null;
  
void insert(int key) {
    if (root is null) {
        root = new Node(key);
        return;
    }
  
    Node p = walk(true)[0];
    auto nullNode = p.left is null ? p.left : p.right;

    if (p.left is null) {
        p.left = new Node(key);
        p.left.p = p; // Correctly set the parent
    } else {
        p.right = new Node(key);
        p.right.p = p; // Correctly set the parent
    }
}


    // rofe is Return on First Empty Parent, used for insert. It returns an arr of length 1 
    // with only the first empty parent.
    Node[] walk(bool rofe) {
      Node[] res;
      if (root is null) return res;
      
      NodeQueue queue = new NodeQueue();
      queue.enqueue(root);
      
      while(!(queue.isEmpty())) {
        Node n = queue.dequeue();
        res ~= n;
        
        if(n.left is null) {
          if(rofe) return [n];
        } else { queue.enqueue(n.left); }
        
        if(n.right is null) {
          if(rofe) return [n];
        } else { queue.enqueue(n.right); }
      }
      return res;
    }

    void print() {
      Node[] arr = walk(false);
      
      int count = 1;
      foreach(n; arr) {
        string s = "node " ~ to!string(count) ~ ": ";
        s ~= "key = " ~ to!string(n.key) ~ ", ";
        
        
        if(!(n.p is null)) {
          s ~= "parent key = " ~ to!string(n.p.key) ~ ", ";
        }
        if(!(n.left is null)) {
          s ~= "left key = " ~ to!string(n.left.key) ~ ", ";
        }
        if(!(n.right is null)) {
          s ~= "right key = " ~ to!string(n.right.key) ~ ", ";
        }
        
        writeln(s);
        count++;
      }
    }
}

void main() {
  CompleteBinaryTree cbt = new CompleteBinaryTree();
  
  readln();
  
  string line = readln();
  
  foreach(string t; line.split(" ")) {
    cbt.insert(to!int(chomp(t)));
  }
  
  cbt.print();
}

