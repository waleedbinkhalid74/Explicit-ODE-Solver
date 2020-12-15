function y = explicitEuler(F,y0,dt,tend) 
%% Desription of the functin
% F: function handle of the ODE, which has to be in the form: F(t,y).
% yo: initial condition.
% dt: time step.
% tend: last value of the time vector.
% y: numerical solution of the ODE over the time.
% This function calculates the numerical solution of an ODE of your choice,
% using the explicit euler method.

%% Initializing variables
t = 0:dt:tend; % time vector. 
y = zeros(1,length(t)); % Iniitialization return vector.
y(1) = y0; %Putting the initial value y0 into the vector.

%% Numerical solution
for i = 1:length(t)-1
    y(i+1) = y(i) + dt*F(t(i),y(i));
end



