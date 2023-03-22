# parameters
param budget;
param availableWeek;

param TVCost;
param TVFollower;
param TVWeekCost;

param magazineCost;
param magazineFollower;
param magazineWeekCost;

# variables
var TVMinute;
var magazineMinute;

# objective function
maximize totalViewer:
    magazineMinute * magazineFollower + TVMinute * TVFollower;

# constaints
subject to currentBudget:
    magazineCost * magazineMinute + TVCost * TVMinute <= budget;

subject to TVTime:
    TVMinute >= 10;

subject to magazineTime:
    magazineMinute >= 0;

subject to weekCost:
    TVWeekCost * TVMinute + magazineWeekCost * magazineMinute <= availableWeek;