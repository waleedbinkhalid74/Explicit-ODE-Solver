function apprxError = approxErrorCalculator(method, dt, tend, F, p0)
%% Calculate the approximated error
% method: ODE solver method
% dt: time step
% tend: last value of the time vector
% F: function handle of the ODE
% p0: initial conditon
% apprxError: vector of all approximate errors, corresponding to the most 
%             accurate solution of the given method

%% Approximate Error for euler method
if method == "eulerMethod"
    apprxError = zeros(1, length(dt)); %Initializing error vector for euler error vs exact solution
    best_apprx = explicitEuler(F,p0, dt(4),tend); % Initializing the vector of the best approximation
    for i=1:length(dt)
        %calculating the error for each dt
        apprxError(i) = sqrt(dt(i)/tend*sum((explicitEuler(F,p0, dt(i),tend)-best_apprx(1:dt(i)/dt(4):end)).^2));
    end
end

%% Approximate Error for heun's method
if method == "heunMethod"
    apprxError = zeros(1, length(dt)); %Initializing error vector for heun error vs exact solution
    best_apprx = heun(F,p0, dt(4),tend); % Initializing the vector of the best approximation
    for i=1:length(dt)-1
        %calculating the error for each dt
        apprxError(i) = sqrt(dt(i)/tend*sum((heun(F,p0, dt(i),tend)-best_apprx(1:dt(i)/dt(4):end)).^2));
    end
end

%% Approximate Error for Runge Kutta method
if method == "rungeKuttaMethod"
   apprxError = zeros(1, length(dt)); %Initializing error vector for runge Kutta error vs exact solution
   best_apprx = rungeKutta(F,p0, dt(4),tend); % Initializing the vector of the best approximation
   for i=1:length(dt)-1
        %calculating the error for each dt
        apprxError(i) = sqrt(dt(i)/tend*sum((rungeKutta(F,p0, dt(i),tend)-best_apprx(1:dt(i)/dt(4):end)).^2));
   end
end
end

