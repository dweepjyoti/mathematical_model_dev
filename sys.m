function dx = sys(t,u,x0,sys)
dx = sys(:,1:3)*x0 + sys(:,4)*u;
end