module le3.c;

import std.stdio;
import std.conv;
import std.string;
import std.array;

struct Node {
    int key;
    Node* prev;
    Node* next;

    this(int key) {
        this.key = key;
        this.prev = null;
        this.next = null;
    }
}

class DoublyLinkedList {
    Node* head;
    Node* tail;

    this() {
        this.head = null;
        this.tail = null;
    }

    void insert(int x) {
        auto newNode = new Node(x);
        if (head is null) {
            head = tail = newNode;
        } else {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        }
    }

    void deleteKey(int x) {
        auto current = head;
        while (current !is null) {
            if (current.key == x) {
                if (current == head) {
                    head = current.next;
                    if (head !is null) {
                        head.prev = null;
                    } else {
                        tail = null;
                    }
                } else if (current == tail) {
                    tail = current.prev;
                    if (tail !is null) {
                        tail.next = null;
                    } else {
                        head = null;
                    }
                } else {
                    current.prev.next = current.next;
                    current.next.prev = current.prev;
                }
                break;
            }
            current = current.next;
        }
    }

    void deleteFirst() {
        if (head !is null) {
            head = head.next;
            if (head !is null) {
                head.prev = null;
            } else {
                tail = null;
            }
        }
    }

    void deleteLast() {
        if (tail !is null) {
            tail = tail.prev;
            if (tail !is null) {
                tail.next = null;
            } else {
                head = null;
            }
        }
    }

    override string toString() {
        string result;
        auto current = head;
        while (current !is null) {
            result ~= to!string(current.key);
            current = current.next;
            if (current !is null) {
                result ~= " ";
            }
        }
        return result;
    }
}

void main() {
    try {
        // Read number of operations
        int n = to!int(readln().strip);

        // Process each operation
        auto list = new DoublyLinkedList();
        foreach (i; 0 .. n) {
            auto line = readln().strip;
            auto parts = line.split(" ");

            if (parts.length > 0) {
                if (parts[0] == "insert" && parts.length == 2) {
                    int x = to!int(parts[1]);
                    list.insert(x);
                } else if (parts[0] == "delete" && parts.length == 2) {
                    int x = to!int(parts[1]);
                    list.deleteKey(x);
                } else if (parts[0] == "deleteFirst" && parts.length == 1) {
                    list.deleteFirst();
                } else if (parts[0] == "deleteLast" && parts.length == 1) {
                    list.deleteLast();
                } else {
                    writeln("Invalid operation:", line);
                }
            } else {
                writeln("Invalid operation:", line);
            }
        }

        // Output final list
        writeln(list.toString());
    } catch (Throwable e) {
        writeln("Error: ", e.msg);
    }
}
