function error = errorCalculator(method, dt, tend, F, p0)
%% Calculate the error
% method: ODE solver method
% dt: time step
% tend: last value of the time vector
% F: function handle of the ODE
% p0: initial conditon
% error: vector of all exact errors, corresponding to the analytical
%        solution

%% Error for euler method
if method == "eulerMethod"
    error = zeros(1, length(dt)); %Initializing error vector for euler error vs exact solution
    for i=1:length(dt)
        %calculating the error for each dt
        error(i) = sqrt(dt(i)/tend*sum((explicitEuler(F,p0, dt(i),tend)-Utilities.p_exact(dt(i),tend)).^2));
    end
end
%% Error for heun's method
if method == "heunMethod"
    error = zeros(1, length(dt)); %Initializing error vector for heun error vs exact solution
    for i=1:length(dt)
        %calculating the error for each dt
        error(i) = sqrt(dt(i)/tend*sum((heun(F,p0, dt(i),tend)-Utilities.p_exact(dt(i),tend)).^2));
    end
end
%% Error for Runge Kutta method
if method == "rungeKuttaMethod"
    error = zeros(1, length(dt)); %Initializing error vector for runge Kutta error vs exact solution
    for i=1:length(dt)
        %calculating the error for each dt
        error(i) = sqrt(dt(i)/tend*sum((rungeKutta(F,p0, dt(i),tend)-Utilities.p_exact(dt(i),tend)).^2));
    end
end
end