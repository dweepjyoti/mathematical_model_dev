% curve fitting

clear all;
clc;
t = 0:10:90;
x = sind(t)
max_param = 7;
m = size(t)
theta = zeros(max_param, max_param);
% polynomial of type a0+ a1*t + a2*t2+...+an*tn = y(t)
% generation of PHI(t) and generation of Parameter
h = ones(m(1,2),1);
for n= 1 : max_param
        if n ~= 1
        h = [h t'.^(n-1)];
        end
        theta(n,1:n) = (inv(h'*h))*h'*x';
end
yn = theta* h';
plot(t,x,'r*', t,yn)

% error function calculation
for n= 1 : max_param
    er(n,:) = 0.5* (x - yn(n,:))*(x - yn(n,:))' 
end

% Conclusion  :
% more degree of parametrization means more smooth fitting
% over fitting results  badly scaled output in matlab. it does not depend
% on the number of samples taken