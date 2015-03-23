clc;clear all;
global vt va r k
k = 1;
vt = 5;
va = 15;
Wi = [50,0];Wf = [50,100];
uav_st = [0,0];
chi_a = 0.5235;
i = 0;

ti1 = 0;
ti2 = 0;
chidot_a = 10;

x_t_0 = Wi(1,1); y_t_0 = Wi(1,2);

tic;
while(toc<7)
       
if(i ~= 0)
Wi(1,2) =  vt*toc;
end

chi_t = atan2(Wf(1,2) - Wi(1,2) , Wf(1,1) - Wi(1,1));
theta = atan2(uav_st(1,2) - Wi(1,2),uav_st(1,1) - Wi(1,1));

xdot_t = vt*cos(chi_t);
ydot_t = vt*sin(chi_t);
chidot_t = 0;

tf1 = toc;
x_t = (tf1 - ti1)*(xdot_t) + x_t_0;
y_t = (tf1 - ti1)*(ydot_t) + y_t_0;
ti1 = toc;

X_t(i+1,1) = x_t;Y_t(i+1,1) = y_t;

u = -k*(chi_a - theta);

if(u>0.8*9.8)
    u = 0.8*9.8;
end

chidot_a = u/va;


tf2 = toc;
chi_a = (tf2 - ti2)*(chidot_a) + pi;
xdot_a = va*cos(chi_a);
ydot_a = va*sin(chi_a);
x_a = (tf2 - ti2)*(xdot_a) + uav_st(1,1);
y_a = (tf2 - ti2)*(ydot_a) + uav_st(1,2);

ti2 = toc;

X_a(i+1,1) = x_a;Y_a(i+1,1) = y_a;

i = i+1;

uav_st(1,1) = x_a;uav_st(1,2) = y_a;

x_t_0 = x_t;y_t_0 = y_t;

plot(x_t+10,y_t,'-o','color','g');
hold on 
plot(x_a,y_a,'-x','color','r');
pause(0.01);
axis([-100 100 -100 100]);
axis('square');
end

len = length(X_a);
j= 1;
tic
while(j<=len)
%   plot(X_t(j)+10,Y_t(j),'-o','color','g');
%hold on
%plot(X_a(j),Y_a(j),'-x','color','r');
%j = j+50;
%pause(0.01);
%axis([0 100 0 100]);
%axis('square');
end


