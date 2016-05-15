# The Floor Planning Problem: A Convex Optimization Approach

This code was produced as part of a mini-project for a [course at EPFL](http://edu.epfl.ch/coursebook/en/convex-optimization-and-applications-CS-454) entiteled "Convex Optimization and Applications". It is written entirely in MATLAB.

Floor planning is an optimization problem that aims to find an optimal placement of rectangles given their individual areas. The problem is NP hard in general. Here, a greedy approach is used to turn it into a convex problem which is thus solved with the [CVX library](http://cvxr.com/cvx/). Detailed study of the problem and the presented solution can be found in my [project report](https://github.com/bojan-karlas/floor-planning/blob/master/report/Bojan-Karlas-Floor-Planning-Report.pdf).

Check out `sampleTest1.m` for a walkthrough of all important steps.