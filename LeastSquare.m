% generation of output
% system dynamics dx/dt = A* x + B* u;
clear all;
clc;
A = [2 -1 5; 5 7 2.5; 0.5 1.2 2.1];
B = [2; -1; 1];
Org_theta = [A,B];
x0 = [1; 2; 0]; % Initial condition of states
t0 = 0; % Starting time
tf = 1; % final time
dt = 0.001; % time Step
t = t0: dt: tf; % time Series for experiment
m = size(t);
u = 10*rand(1,m(1,2));
x_ini = x0;
for i=1:m(1,2)
x(:,i) = rkOde4(t(i),dt,x_ini,u(i),@sys,Org_theta);
x_ini = x(:,i);
end
x = [x0 [x(:,1:m(1,2)-1)]];
xdt = A*x+ B*u;
% Identification algos
%% Least square
y = IdentifyLS([x;u],xdt)