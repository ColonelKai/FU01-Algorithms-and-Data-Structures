import std.stdio;
import std.string;
import std.conv : to;
import std.algorithm;

struct Node
{
    int id;
    int left;
    int right;

    this(int id, int left, int right)
    {
        this.id = id;
        this.left = left;
        this.right = right;
    }
}

class BinaryTree
{
    Node[] nodes;
    int root;

    this(int numNodes)
    {
        nodes = new Node[numNodes];
        root = 0;  // Default root; will be adjusted based on input
    }

    void addNode(int id, int left, int right)
    {
        nodes[id] = Node(id, left, right);
    }

    void determineRoot()
    {
        auto allChildren = new bool[nodes.length];
        allChildren[] = false;  // Initialize all as false
        
        foreach (i; 0 .. nodes.length)
        {
            if (nodes[i].left != -1)
                allChildren[nodes[i].left] = true;
            if (nodes[i].right != -1)
                allChildren[nodes[i].right] = true;
        }
        
        foreach (i; 0 .. nodes.length)
        {
            if (!allChildren[i]) {
                root = to!int(i);
                break;
            }
        }
    }

    void preorder(int nodeId)
    {
        if (nodeId == -1) return;
        write(" ", nodeId);
        preorder(nodes[nodeId].left);
        preorder(nodes[nodeId].right);
    }

    void inorder(int nodeId)
    {
        if (nodeId == -1) return;
        inorder(nodes[nodeId].left);
        write(" ", nodeId);
        inorder(nodes[nodeId].right);
    }

    void postorder(int nodeId)
    {
        if (nodeId == -1) return;
        postorder(nodes[nodeId].left);
        postorder(nodes[nodeId].right);
        write(" ", nodeId);
    }

    void printTreeWalks()
    {
        writefln("Preorder");
        preorder(root);
        writeln();

        writefln("Inorder");
        inorder(root);
        writeln();

        writefln("Postorder");
        postorder(root);
        writeln();
    }
}

void main()
{
    int n = to!int(chomp(stdin.readln()));
    auto tree = new BinaryTree(n);

    foreach (i; 0 .. n)
    {
        auto line = chomp(stdin.readln());
        auto parts = line.split(" ");
        int id = parts[0].to!int;
        int left = parts[1].to!int;
        int right = parts[2].to!int;

        tree.addNode(id, left, right);
    }

    tree.determineRoot();
    tree.printTreeWalks();
}
