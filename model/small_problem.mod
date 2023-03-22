# variable
var x1 >= 0;
var x2 >= 0;
var x3 <= 0;
var x4;

# objective function
minimize z: x1 - 2 * x2 + 3 * x3 - 4 * x4;

# constraints
subject to c1: x1 - x2 - x3 + x4 >= 3;
subject to c2: 2 * x1 + x2 - x3 - x4 <= 4;
subject to c3: 3 * x1 - x2 + x3 - 5 * x4 = 2; 