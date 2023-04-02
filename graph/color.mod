# parameters
param numberOfVertices;

# variables
var color{1..numberOfVertices} binary;

# objective function
minimize totalCost:
    sum {i in 1..numberOfVertices} color[i];

# constraints
subject to colorConstraints{i in 1..numberOfVertices, j in i+1..numberOfVertices, k in j+1..numberOfVertices: i + j = k}:
    1 <= color[i] + color[j] + color[k] <= 2;