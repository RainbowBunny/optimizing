# parameters
param bph;
param cph;
param bProfit;
param cProfit;
param bLimit;
param cLimit;
param timeLimit;

# variables
var xB >= 0;
var xC >= 0;

# objective function
maximize totalProfit:
    xB * bProfit + xC * cProfit;

# constaints
subject to bandLimit:
    xB <= bLimit;

subject to coilLimit:
    xC <= cLimit;

subject to time:
    xB / bph + xC / cph <= timeLimit;