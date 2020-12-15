# Scientific Computing Lab: Worksheet 2

## Group Members: Arian Bajrami, Muhammad Waleed Bin Khalid, Moritz Meyer

In this project, we analyse different ODE solvers, namely explicit Euler, Heun and Runge-Kutta (fourth order).

### worksheet2.m
This script compares the different numerical solving methods to the analytical solution. At first, the analytical one is plotted, thereafter the numerical solutions for different time step sizes are calculated and plotted against the analytical one. Finally, the exact error (with respect to the analytical solution) and the approximate error (with respect to the most accurate numerical solution) are calculated and then shown in a table for each method. Alongside, the factor of error reduction is calcuated for reducing the step size and shown in the table.
### explicitEuler.m
This function calculates the numerical solution of an ODE of your choice, using the explicit Euler method.
### heun.m
This function calculates the numerical solution of an ODE of your choice, using the method of Heun.
### rungeKutta.m
This function calculates the numerical solution of an ODE of your choice, using the Runge Kutta (RK) method.
### approxErrorCalculator.m
This function calculates the approximate error for a given method, by comparing the numerical solution of a time step with the solution of the smallest time step.
### errorCalculator.m
This function calculates the error for a given method, by comparing the numerical solution of a time step with the analytical solution.
### Utilities.m
This file contains a group of helper functions:
1. p_exact: Calculates the analytical solution y for a given time vector t. 
2. createTable: Produces a table for a given method, showing the different time steps, errors, error reductions and approximate errors.
3. plotter: Plots the analytical solution together with the different numerical soluitons of differnt time step sizes for a given method.