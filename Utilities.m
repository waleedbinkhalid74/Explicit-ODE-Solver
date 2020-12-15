classdef Utilities
    methods(Static)
        function p = p_exact(dt, tend)
            %% Calculate the analytical solution
            % dt: time step.
            % tend: last value of the time vector.
            % p: vector containing the values of the analytical solution
            
            t = 0:dt:tend; % time vector.
            p = 10./(1+9.*exp(-t)); %Analytical Solution
        end
        
        function createTable(method, dt, error, error_reduction, error_approx)
            %% Plot the Table with the delta ts, errors, factor of error reduction and the approximated error
            % method: ODE solver method
            % dt: time step
            % error: vector of the calculated errors
            % error_reduction: vector containing the factor of error reduction
            % error_approx: vector of approximated errors
            
            row_header = {'delta t'; 'error'; 'error red.'; 'error app.'};
            if method == "eulerMethod"
                matrix = [dt; error; error_reduction; error_approx];
                figure()
                uitable('rowname',row_header,'position',[20 300 420 100],'data',matrix);
                txt_title = uicontrol('Style', 'text', 'Position', [20 400 500 20], 'String', 'explicit Euler method (q = 1)');
            end
            
            if method == "heunMethod"
                matrix = [dt; error; error_reduction; error_approx];
                figure()
                uitable('rowname',row_header,'position',[20 300 420 100],'data',matrix);
                txt_title = uicontrol('Style', 'text', 'Position', [20 400 500 20], 'String', 'method of Heun (q = 2)');
            end
            
            if method == "rungeKuttaMethod"
                matrix = [dt; error; error_reduction; error_approx];
                figure()
                uitable('rowname',row_header,'position',[20 300 420 100],'data',matrix);
                txt_title = uicontrol('Style', 'text', 'Position', [20 400 500 20], 'String', 'Runge-Kutta method (q = 4)');
            end
            
        end
        
        function plotter(method, p0, F, dt, tend)
            %% Plot the analytical and numerical solutions for the corresponding method
            % method: ODE solver method
            % p0: initial conditon
            % F: function handle of the ODE
            % dt: time step vector
            % tend: last value of the time vector
            
            t = 0:dt(end):tend; % time vector
            p = Utilities.p_exact(dt(end),tend); % calculate the analytical solution
            
            figure(); %Adding new figure
            plot(t,p); %Plotting analytical solution
            hold on
            %% Solving and plotting for explicit euler's method
            if method == "eulerMethod"
                for i=1:length(dt)
                    t_at_specific_dt= 0 : dt(i) :tend; % Time-vector
                    p_explicit_Euler  = explicitEuler(F,p0, dt(i), tend); %Calculating solution via Euler Method
                    plot(t_at_specific_dt, p_explicit_Euler); %Plotting Euler function
                end
                legend('Analytical Solution', 'Numerical Solution dt=1', 'Numerical Solution dt=1/2', 'Numerical Solution dt=1/4', 'Numerical Solution dt=1/8', 'Location', 'northwest')
                title('Numerical solutions vs Analytical solution via Euler Method')
                xlabel('t')
                ylabel('p')
                grid on
            end
            
            %% Solving and plotting for explicit Heun's method
            if method == "heunMethod"
                for i=1:length(dt)
                    t_at_specific_dt= 0 : dt(i) :tend; % Time-vector
                    p_heun = heun(F,p0, dt(i), tend); %Calculating solution via Heun's Method
                    plot(t_at_specific_dt, p_heun); %Plotting Heuns Method function
                end
                legend('Analytical Solution', 'Numerical Solution dt=1', 'Numerical Solution dt=1/2', 'Numerical Solution dt=1/4', 'Numerical Solution dt=1/8', 'Location', 'northwest')
                title('Numerical solutions vs Analytical solution via Heun Method')
                xlabel('t')
                ylabel('p')
                grid on
            end
            
            %% Solving and plotting for explicit Runge Kutta method
            if method == "rungeKuttaMethod"
                for i=1:length(dt)
                    t_at_specific_dt= 0 : dt(i) :tend; % Time-vector
                    p_rungeKutta = rungeKutta(F,p0, dt(i), tend); %Calculating solution via Runge Kutta Method
                    plot(t_at_specific_dt, p_rungeKutta); %Plotting Runge Kutta function
                end
                legend('Analytical Solution', 'Numerical Solution dt=1', 'Numerical Solution dt=1/2', 'Numerical Solution dt=1/4', 'Numerical Solution dt=1/8', 'Location', 'northwest')
                title('Numerical solutions vs Analytical solution via Runge Kutta Method')
                xlabel('t')
                ylabel('p')
                grid on
            end
        end

    end
end