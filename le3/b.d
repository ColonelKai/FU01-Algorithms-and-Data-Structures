import std.stdio;
import std.string;
import std.algorithm;
import std.range;
import std.conv;

struct Process {
    string name;
    int time;
}

struct Queue {
    Process[] processes;

    void enqueue(Process process) {
        processes ~= process;
    }

    Process dequeue() {
        auto front = processes.front;
        processes = processes[1 .. $];
        return front;
    }

    bool empty() const {
        return processes.empty;
    }

    size_t length() const {
        return processes.length;
    }
}

void main() {
    int n; // number of processes
    int q; // quantum

    // Read input
    readf("%d %d\n", &n, &q);

    Queue queue;
    
    // Read each process details and enqueue
    foreach (_; 0 .. n) {
        string name;
        int time;
        readf("%s %d\n", &name, &time);
        queue.enqueue(Process(name, time));
    }

    int currentTime = 0;
    while (!queue.empty()) {
        auto currentProcess = queue.dequeue();

        // Process the current process for quantum q or its remaining time, whichever is smaller
        int processTime = min(q, currentProcess.time);

        // Update current time
        currentTime += processTime;

        // Update remaining time for the current process
        currentProcess.time -= processTime;

        // If process is not completed, enqueue it again
        if (currentProcess.time > 0) {
            queue.enqueue(currentProcess);
        } else {
            writeln(currentProcess.name, " ", currentTime);

        }
    }
}
      
