import std.stdio, std.conv, std.string;

void main() {
    // Read the number of instructions
    int n = to!int(chomp(readln()));

    // Initialize an associative array to store the strings
    string[string] dictionary;

    // Initialize an array to collect the output
    string[] output;

    // Process each instruction
    foreach (_; 0 .. n) {
        string instruction = chomp(readln());
        auto parts = instruction.split(' ');

        if (parts[0] == "insert") {
            dictionary[parts[1]] = parts[1];
        } else if (parts[0] == "find") {
            if (parts[1] in dictionary) {
                output ~= "yes";
            } else {
                output ~= "no";
            }
        }
    }

    // Print all output at once
    foreach (line; output) {
        writeln(line);
    }
}
