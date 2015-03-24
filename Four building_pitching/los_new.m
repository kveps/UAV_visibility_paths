clc;clear all;
close all;

rotate3d;

h = 700;%input('Enter the height of UAV: ');

const1 = 0;
const2 = 1500;

R = [750,0,0];%input('Enter the point on the road: ');

ad = [500,300,500];%input('Enter [l,w,h] of 1st building: ');
bd = [500,300,300];%input('Enter [l,w,h] of 2nd 1building: ');
cd = [500,400,200];%input('Enter [l,w,h] of 1st building: ');
dd = [500,400,300];%input('Enter [l,w,h] of 2nd 1building: ');
wr = 200;%input('Enter width of the road: ');

a = [0,1125,0];%input('Enter centre of building: ');
b = [0,375,0];
c = [0,375,0];
d = [0,1125,0];
a(1,1) = 750 + (wr/2) + (ad(1,2)/2);
b(1,1) = 750 + (wr/2) + (bd(1,2)/2);
c(1,1) = 750 - (wr/2) - (cd(1,2)/2);
d(1,1) = 750 - (wr/2) - (dd(1,2)/2);

la = ad(1,1);wa = ad(1,2);ha = ad(1,3);

lb = bd(1,1);wb = bd(1,2);hb = bd(1,3);

lc = cd(1,1);wc = cd(1,2);hc = cd(1,3);

ld = dd(1,1);wd = dd(1,2);hd = dd(1,3);

wrs = 375-(la/2) + 375 - (lb/2);

global k kp vt va r U TIME X Y 

[X Y Z] = visibility(h);

patch(X,Y,Z,'green');

 
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);
voxel(d + [-wd/2,-ld/2,0],[wd ld hd],'c',0.7);



hold on 




k = 5;
kp = 10;
vt = 10;
va = 20;
r=  0.5;
U = [];
TIME = [];

Wi = [750,750];Wf = [750,1500];


x_t_0 = Wi(1,1);
y_t_0 = Wi(1,2);
chi_t_0 = 0;

x_a_0 = 600;
y_a_0 = 0;
h_uav = h;
psi_a_0 = pi/6;
gama_a_0 = 0;


tspan = [0,50];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;h_uav;psi_a_0;gama_a_0;];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('los_4_new',tspan,z0,options);



x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);h_uav = z(:,6);

chi_t = z(:,3);psi_a = z(:,7);gama_a = z(:,8);



len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    %h_uav(check,1) = h;
end


set(gcf,'Renderer','zbuffer'); 

%writerObj = VideoWriter('example.avi');
%writerObj.FrameRate = 10;
%open(writerObj);

% Animation Loop
i = 1;
while i<=length(x_t)
    plot3(x_t(i),y_t(i),h_t(i),'color','b');
    hold on
    plot3(x_a(i),y_a(i),h_uav(i),'color','r');
    hold on
    [X_new,Y_new,Z_new] = visibility(h_uav(i));
    patch(X_new,Y_new,Z_new,'green','FaceAlpha',0);
    axis([0 1500 0 1500]);
    drawnow;
    %frame = getframe(gcf);
    %writeVideo(writerObj,frame);
    pause(0.01);
    i = i+1;
end

%close(writerObj);

axis equal;
axis([0 1500 0 1500]);
axis('square');

figure(2)
plot(t,gama_a);
