# parameters

set CHEM;

param minPer{CHEM} >= 0;
param maxPer{j in CHEM} >= minPer[j];

set RAWM;

param component{RAWM, CHEM};
param avail{RAWM};
param cost{RAWM};

param totalWeight;

# variables
var x{RAWM};

# objective function
minimize totalCost:
    sum {j in RAWM} x[j] * cost[j];

# constraints
subject to weight{i in RAWM}:
    0 <= x[i] <= avail[i];

subject to total:
    sum {j in RAWM} x[j] = totalWeight;

subject to minCom{j in CHEM}:
    sum {i in RAWM} x[i] * component[i, j] >= minPer[j] * totalWeight; 

subject to maxCom{j in CHEM}:
    sum {i in RAWM} x[i] * component[i, j] <= maxPer[j] * totalWeight; 