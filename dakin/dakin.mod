var x1 integer >= 0;
var x2 integer >= 0;
var x3 >= 0;

maximize z:
    3 * x1 + 2 * x2 + x3;

subject to c1:
    x1 + 5 * x3 <= 10;

subject to c2:
    3 * x1 + 4 * x2 - x3 <= 9;