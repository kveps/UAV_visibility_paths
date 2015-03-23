
clc;clear all;
close all;

global k vt va r THETA TIME
 
k = 5;
vt = 5;
va = 8;
r=  01;
THETA = [];
TIME = [];

Wi = [50,0];Wf = [50,100];


x_t_0 = Wi(1,1);
y_t_0 = Wi(1,2);
chi_t_0 = pi/2;

x_a_0 = 25;
y_a_0 = 0;
chi_a_0 = pi/4;


tspan = [0,30];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;];

[t,z] = ode45('los',tspan,z0);



x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);


figure(1)
hold on
plot(x_t,y_t,'color','g');
hold on 
plot(x_a,y_a,'color','r');


figure(2)



chi_r = chi_a*180/pi;
%figure(3)
%plot(t,chi_r);



%axis([-100 200 -100 200]);
axis('square');




