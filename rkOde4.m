function x_next = rkOde4(t,dt,x,u,f,sys_parameter)
%*****************************************************************************
%
%% RK4 takes one Runge-Kutta step.
%
%  Discussion:
%
%    It is assumed that an initial value problem, of the form
%
%      du/dt = f ( t, x,  sys_parameter)
%      x(t0) = x;
%
%    is being solved.
%
%    If the user can supply current values of time instant t, a stepsize dt,
%    initial state x and system parameters used for the system dynamics
%    function sys_parameter....
%    function to evaluate the derivative, this function can compute the
%    fourth-order Runge Kutta estimate to the solution at time t+dt.
%
%   Parameters:
%
%    Input, real t, the current time.
%
%    Input, real dt, the time step.
%
%    Input, real x, the initial condition for the solution.
%
%    Input, function value = f ( t, x, system_parameter ), a function which evaluates
%    the derivative, or right hand side of the problem.
%
%    Input, real matrix system_parameter, parameters defined in system dynamics
%    
%    Output, real , the fourth-order Runge-Kutta solution estimate at time T0+DT.
%
%   Author ::      Dweepjyoti Malakar
%   Date   ::      03/03/2016
%   developed for academic purpose in IIST Trivandrum
%% ------------------------------------------------------------------------

    k_1 = f(t,u,x,sys_parameter);
    k_2 = f((t+0.5*dt),(u+0.5*dt),(x+0.5*dt*k_1),sys_parameter);
    k_3 = f((t+0.5*dt),(u+0.5*dt),(x+0.5*dt*k_2),sys_parameter);
    k_4 = f((t+dt),(u+dt),(x+dt*k_3),sys_parameter);

    x_next = x + (1/6)*(k_1+2*k_2+2*k_3+k_4)*dt;  % main equation
return
end