function y = rungeKutta(F,y0,dt,tend) 
%% Desription of the function
% F: function handle of the ODE, which has to be in the form: F(t,y).
% yo: initial condition.
% dt: time step.
% tend: last value of the time vector.
% y: numerical solution of the ODE over the time.
% This function calculates the numerical solution of an ODE of your choice,
% using the Runge Kutta (RK) method.

%% Initializing variables
t = 0:dt:tend; % time vector. 
y = zeros(1,length(t)); % Iniitialization return vector.
y(1) = y0; %Putting the initial value y0 into the vector.

%% Numerical solution
for i = 1:length(t)-1
    Y1=F(t(i),y(i)); %Stage 1
    Y2=F(t(i)+dt/2,y(i)+dt/2*Y1); %Stage 2
    Y3=F(t(i)+dt/2,y(i)+dt/2*Y2); %Stage 3
    Y4=F(t(i+1),y(i)+dt*Y3); %Stage 4
    
    y(i+1) = y(i)+dt*1/6*(Y1+2*Y2+2*Y3+Y4);
end

