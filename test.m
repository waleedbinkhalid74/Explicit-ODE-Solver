clear;
clc;
F = @(t,y) 1-y;
exact= 1-exp(-1)
y0=0;
dt=0.1;
tend=1;

E  = explicitEuler(F,y0,dt,tend); %N=1/0.0001 = 10000
%H  = heun(F,y0,dt/100,tend); %N=1/0.0001*10 = 1000
RK  = rungeKutta(F,y0,dt,tend); %N=1/0.0001*1000 = 10


E(end)-exact
%H(end)
RK(end)-exact