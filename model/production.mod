# parameters
set P;
param a{j in P}; # tons per hours of products
param b; # hours available
param c{j in P}; # profit per tons
param u{j in P}; # maximum tons of products

# variables
var x{j in P}; # number of tons 

# objective function
maximize totalProfit:
    sum{j in P} c[j] * x[j];

# constraints
subject to time:
    sum{j in P} x[j] / a[j] <= b;

subject to limit{j in P}:
    0 <= x[j] <= u[j];