import std.stdio;
import std.math;
import std.array;
import std.format;
import std.conv;

struct Point {
    double x, y;

    this(double x, double y) {
        this.x = x;
        this.y = y;
    }

    string toString() {
        return format("%.8f %.8f", x, y);
    }
}

// Calculate the point one third along the line from p1 to p2
Point thirdPoint(Point p1, Point p2) {
    return Point((2 * p1.x + p2.x) / 3, (2 * p1.y + p2.y) / 3);
}

// Calculate the point for the peak of the equilateral triangle
Point equilateralPoint(Point p1, Point p2) {
    double dx = p2.x - p1.x;
    double dy = p2.y - p1.y;
    double length = sqrt(dx * dx + dy * dy);
    double height = length * sqrt(to!double(3)) / 2; // Height of the equilateral triangle

    // Midpoint of the base segment
    double mx = (p1.x + p2.x) / 2.0;
    double my = (p1.y + p2.y) / 2.0;

    // Perpendicular direction vector to the base segment
    double px = -dy / length;
    double py = dx / length;

    // Peak point calculation
    return Point(mx + height * px, my + height * py);
}


void kochCurve(int n, Point p1, Point p2, ref Point[] points) {
    if (n == 0) {
        points ~= p2;
        return;
    }

    Point p3 = thirdPoint(p1, p2); // Point 1/3
    Point p4 = thirdPoint(p2, p1); // Point 2/3
    Point p5 = equilateralPoint(p3, p4); // Peak of the triangle

    // Recursively generate the Koch curve for each segment
    kochCurve(n - 1, p1, p3, points);
    kochCurve(n - 1, p3, p5, points);
    kochCurve(n - 1, p5, p4, points);
    kochCurve(n - 1, p4, p2, points);
}



void main() {
    int n;
    readf(" %d", &n);

    if (n < 0 || n > 6) {
        writeln("The input n must be between 0 and 6.");
        return;
    }

    Point[] points;
    points ~= Point(0, 0);
    kochCurve(n, Point(0, 0), Point(100, 0), points);

    foreach (p; points) {
        writeln(p);
    }
}

