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
dt = 0.01; % time Step
t = t0: dt: tf; % time Series for experiment
m = size(t);
alpha = 20; % Initial Guess
u = ones(1,m(1,2));
x_ini = x0;
disp('Initial P')
P_ini=alpha*eye(4)
disp('Initial Guess')
theta_ini=[.1 .1 .1 .1;.1 .1 .1 .1;.1 .1 .1 .1] %% Initial Guess of theta
% Iteration Starts
for i=1:m(1,2)
phi = [x_ini;u(i)];
X=theta_ini*phi;
xdt = A*x_ini+ B*u(i);
e=xdt-X;
if e==[0 0 0]'
     {
      theta==theta_ini};
  break;
else          
       P=  P_ini-((P_ini*phi*phi'*P_ini)/(1+(phi'*P_ini*phi)));
       theta=theta_ini+e*phi'*P;
       theta_ini=theta;
       P_ini=P;
end
x(:,i) = rkOde4(t(i),dt,x_ini,u(i),@sys,Org_theta);
x_ini = x(:,i);
end
theta
disp('Original Theta')
Org_theta
%% Reachability depends on step size taken, Gain(Alpha), Initial Guess