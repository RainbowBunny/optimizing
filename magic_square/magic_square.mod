# parameters
param n;

# variables
var x{1..n, 1..n, 1..(n*n)} binary;

# objective functions
minimize totalCost:
    sum {i in 1..n, j in 1..n, k in 1..(n * n)} x[i, j, k];

# constraints
subject to uniqueOccurence{i in 1..(n * n)}:
    sum {j in 1..n, k in 1..n} x[j, k, i] = 1;

subject to rowSum{i in 1..n}:
    sum {j in 1..n, k in 1..(n * n)} x[i, j, k] * k = n * n * (n * n + 1) / 6;

subject to colSum{j in 1..n}:
    sum {i in 1..n, k in 1..(n * n)} x[i, j, k] * k = n * n * (n * n + 1) / 6;

subject to uniqueCell{i in 1..n, j in 1..n}:
    sum {k in 1..n*n} x[i, j, k] = 1;

subject to mainDiagonal:
    sum {i in 1..n, j in 1..(n*n)} x[i, i, j] * j = n * n * (n * n + 1) / 6;

subject to minorDiagonal:
    sum {i in 1..n, j in 1..(n*n)} x[i, n - i + 1, j] * j = n * n * (n * n + 1) / 6;