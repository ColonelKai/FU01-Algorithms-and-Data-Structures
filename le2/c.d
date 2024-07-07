import std.stdio;
import std.array;
import std.algorithm;
import std.conv;

struct Card {
    char suit;
    int value;
}

void bubbleSort(Card[] cards) {
    foreach (int i; 0 .. cast(int)(cards.length)) {
        foreach_reverse (int j; i + 1 .. cast(int)(cards.length)) {
            if (cards[j].value < cards[j-1].value) {
                swap(cards[j], cards[j-1]);
            }
        }
    }
}

void selectionSort(Card[] cards) {
    foreach (int i; 0 .. cast(int)(cards.length)) {
        int mini = i;
        foreach (int j; i .. cast(int)(cards.length)) {
            if (cards[j].value < cards[mini].value) {
                mini = j;
            }
        }
        swap(cards[i], cards[mini]);
    }
}

bool isStable(Card[] original, Card[] sorted) {
    foreach (v; 1 .. 10) {
        auto originalFiltered = original.filter!(c => c.value == v).array;
        auto sortedFiltered = sorted.filter!(c => c.value == v).array;
        if (originalFiltered != sortedFiltered) {
            return false;
        }
    }
    return true;
}

void main() {
    // Read input
    int n;
    readf("%d\n", &n);
    // Read the entire line of input into a buffer
    char[] inputLine;
    readln(inputLine);

    // Convert the buffer to a string
    string line = inputLine.to!string;

    // Split the input line into individual card strings
    string[] cardStrs = line.split(" ");

    // Create cards array
    Card[] cards;
    foreach (string c; cardStrs) {
        cards ~= Card(c[0], c[1] - '0');
    }

    // Original cards array to check stability
    Card[] originalCards = cards.dup;
    
    // Bubble Sort
    bubbleSort(cards);
    string bubbleSortedStr = cards.map!(c => c.suit ~ c.value.to!string).join(" ");
    writeln(bubbleSortedStr);
    if (isStable(originalCards, cards)) {
        writeln("Stable");
    } else {
        writeln("Not stable");
    }

    // Reset cards array for Selection Sort
    cards = originalCards.dup;

    // Selection Sort
    selectionSort(cards);
    string selectionSortedStr = cards.map!(c => c.suit ~ c.value.to!string).join(" ");
    writeln(selectionSortedStr);
    if (isStable(originalCards, cards)) {
        writeln("Stable");
    } else {
        writeln("Not stable");
    }
}
