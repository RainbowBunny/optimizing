var x1 binary;
var x2 binary;

maximize z:
    2 * x1 + x2;

subject to c1:
    x1 + x2 <= 5;

subject to c2:
    -x1 + x2 <= 0;

subject to c3:
    6 * x1 + 2 * x2 <= 21;
