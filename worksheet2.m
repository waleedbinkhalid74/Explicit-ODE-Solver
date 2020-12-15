clear all
close all

%% Initializiation of our first conditions
p0 = 1; % Initial Condition
dt = 0.01; % Defintion of our constant time step
tend=5; %Ending time
t= 0 : dt :tend; % Time-vector 

%% Definition of our initial functions
p = Utilities.p_exact(dt,tend);
pdot = (1- p./10).*p;
P = @(t,p)(1- p/10)*p;
%% Task a: Plotting of the pre-defined analtical solution
figure(1)
plot(t,p,'b')
legend('population','location','best')
title('Analytical solution of the population model')
xlabel('t')
ylabel('p')
grid on

%% Task b done in separate functions

%% Task c) i)
dt = [1, 1/2, 1/4, 1/8]; %vector of Different timesteps
tend=5; %ending time

%Plotting function along with numerical solutions for different schemes
Utilities.plotter("eulerMethod", p0, P, dt, tend);
Utilities.plotter("heunMethod", p0, P,dt, tend);
Utilities.plotter("rungeKuttaMethod", p0, P, dt, tend);

%% Task c) ii)

%Euler Error
error_euler = errorCalculator("eulerMethod", dt, tend, P, p0); %Initializing error vector for euler error vs exact solution
error_heun = errorCalculator("heunMethod", dt, tend, P, p0); %Initializing error vector for heun vs exact solution
error_rungeKutta = errorCalculator("rungeKuttaMethod", dt, tend, P, p0); %Initializing error vector for runge Kutta vs exact solution


%% Task c) iii)
%calculating error reduction for each method
error_reduction_euler = [error_euler(2)/error_euler(1),error_euler(3)/error_euler(2),error_euler(4)/error_euler(3), NaN];
error_reduction_heun = [error_heun(2)/error_heun(1),error_heun(3)/error_heun(2),error_heun(4)/error_heun(3), NaN];
error_reduction_rungeKutta = [error_rungeKutta(2)/error_rungeKutta(1),error_rungeKutta(3)/error_rungeKutta(2),error_rungeKutta(4)/error_rungeKutta(3), NaN];


%% Task c) iv)
%calculating the approximate error for each method

error_approx_euler = approxErrorCalculator("eulerMethod", dt, tend, P, p0);
error_approx_heun =  approxErrorCalculator("heunMethod", dt, tend, P, p0);
error_approx_rungeKutta =  approxErrorCalculator("rungeKuttaMethod", dt, tend, P, p0);

%% Create the tables for Euler, Heun and Runge Kutta method
Utilities.createTable("eulerMethod",dt,error_euler, error_reduction_euler,error_approx_euler)
Utilities.createTable("heunMethod",dt,error_heun, error_reduction_heun,error_approx_heun)
Utilities.createTable("rungeKuttaMethod",dt,error_rungeKutta, error_reduction_rungeKutta,error_approx_rungeKutta)
