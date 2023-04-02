# parameters

param boardSize;
param cost{1..boardSize, 1..boardSize};
param preOrdered{1..boardSize, 1..boardSize};

# variables

var x{1..boardSize, 1..boardSize} binary;

# objective function

maximize numberOfQueen:
    sum {i in 1..boardSize, j in 1..boardSize} x[i, j] * cost[i, j];

# constraints

subject to row{i in 1..boardSize}:
    sum {j in 1..boardSize} x[i, j] <= 1;

subject to col{i in 1..boardSize}:
    sum {j in 1..boardSize} x[j, i] <= 1;

subject to minorDiagonal{i in 2..(2*boardSize)}:
    sum {j in 1..boardSize, k in 1..boardSize: j + k = i} x[j, k] <= 1;

subject to majorDiagonal{i in (1-boardSize)..(boardSize-1)}:
    sum {j in 1..boardSize, k in 1..boardSize: j - k = i} x[j, k] <= 1;

subject to preOrderedQueen{i in 1..boardSize, j in 1..boardSize}:
    x[i, j] - preOrdered[i, j] >= 0;