clc;clear all;
close all;

rotate3d;

icc = 0; bat =0;
target_pos_0 = [1500,1000,0];
plot3(target_pos_0(1,1),target_pos_0(1,2),target_pos_0(1,3),'o','MarkerSize',7,'MarkerFaceColor','b');
sensor_range = 3000;

for t = 1:1:9

h = 400;%input('Enter the height of UAV: ');
const1 = 0;const2 = 1500;

ad(t,:) = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
bd(t,:) = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');
cd(t,:) = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
dd(t,:) = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');

switch(t)
    case 1
        i = 0;
        j = 0;
        ad(1,3)= 280;bd(1,3) = 270;cd(1,3)= 300;dd(1,3) = 315;

    case 2
        i = 750;
        j = 0;
        ad(2,3)= 350;bd(2,3) = 320;cd(2,3)= 270;dd(2,3) = 280;
        
    case 3
        i = 1500;
        j = 0;
        ad(3,3)= 296;bd(3,3) = 277;cd(3,3)= 320;dd(3,3) = 350;
        
    case 4
        i = 0;
        j = 750;
        ad(4,3)= 270;bd(4,3) = 280;cd(4,3)= 315;dd(4,3) = 270;
        
    case 5
        i = 750;
        j = 750;
        ad(5,3)= 260;bd(5,3) = 350;cd(5,3)= 280;dd(5,3) = 270;
        
    case 6
        i = 1500;
        j = 750;
        ad(6,3)= 260;bd(6,3) = 296;cd(6,3)= 350;dd(6,3) = 260;
        
    case 7
        i = 0;
        j = 1500;
        ad(7,3)= 280;bd(7,3) = 270;cd(7,3)= 270;dd(7,3) = 315;
        
    case 8
        i = 750;
        j = 1500;
        ad(8,3)= 310;bd(8,3) = 260;cd(8,3)= 270;dd(8,3) = 280;
        
    case 9
        i = 1500;
        j = 1500;
        ad(9,3)= 250;bd(9,3) = 260;cd(9,3)= 260;dd(9,3) = 310;
        
end

wr = 250;%input('Enter width of the road: ');
wrs = 250;

a(t,:) = [1125+i,1125+j,0];%input('Enter centre of building: ');
b(t,:) = [1125+i,375+j,0];
c(t,:) = [375+i,375+j,0];
d(t,:) = [375+i,1125+j,0];

la = ad(t,1);wa = ad(t,2);ha = ad(t,3);
lb = bd(t,1);wb = bd(t,2);hb = bd(t,3);
lc = cd(t,1);wc = cd(t,2);hc = cd(t,3);
ld = dd(t,1);wd = dd(t,2);hd = dd(t,3);
 
voxel(a(t,:) + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b(t,:) + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c(t,:) + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);
voxel(d(t,:) + [-wd/2,-ld/2,0],[wd ld hd],'c',0.7);
 

axis([0 3000 0 3000]);
axis('square');

hold on 

end

for k = 1:1:3
    
    max1 = max([cd(k,3) dd(k,3) cd(k+6,3) dd(k+6,3)]);
    if max1 == cd(k,3)
        cen1 = c(k,:);
    end
    if max1 == dd(k,3)
        cen1 = d(k,:);
    end
    if max1 == cd(k+6,3)
        cen1 = c(k+6,:);
   end 
   if max1 == dd(k+6,3)
        cen1 = d(k+6,:);
   end
        
    max2 = max([ad(k,3) bd(k,3) ad(k+6,3) bd(k+6,3)]);
    if max2 == ad(k,3)
        cen2 = a(k,:);
    end
    if max2 == bd(k,3)
        cen2 = b(k,:);
    end
    if max2 == ad(k+6,3)
        cen2 = a(k+6,:);
   end 
   if max2 == bd(k+6,3)
        cen2 = b(k+6,:);
   end  
   
   if k==1
   R1 = [750, 125.01,0]; R2 = [750, 2874.99,0];
   end
   
   if k==2
   R1 = [1500, 125.01,0]; R2 = [1500, 2874.99 ,0];
   end
   
   if k==3
   R1 = [2250, 125.01,0]; R2 = [2250, 2874.99,0];
   end
   
   melon = 1;
   [X,Y] = approx_visiblity(max1, cen1, max2, cen2,h, R1, R2,melon);
    
  num = numel(X);

for i = 1:1:num;
    Z(i,1) = h;
end
    
   if k == 1
       Q(1,:) = X; Q(2,:) = Y; Q(3,:) = Z;
   end
   if k == 2
       S(1,:) = X; S(2,:) = Y; S(3,:) = Z;
   end
   if k == 3
       T(1,:) = X; T(2,:) = Y; T(3,:) = Z;
   end
   
   %patch(X,Y,Z,'green');
   
   hold on 
   
end

for k = 1:3:7
    
    max1 = max([cd(k,3) bd(k,3) cd(k+2,3) bd(k+2,3)]);
    if max1 == cd(k,3)
        cen1 = c(k,:);
    end
    if max1 == bd(k,3)
        cen1 = b(k,:);
    end
    if max1 == cd(k+2,3)
        cen1 = c(k+2,:);
   end 
   if max1 == bd(k+2,3)
        cen1 = b(k+2,:);
   end
        
    max2 = max([dd(k,3) ad(k,3) dd(k+2,3) ad(k+2,3)]);
    if max2 == dd(k,3)
        cen2 = d(k,:);
    end
    if max2 == ad(k,3)
        cen2 = a(k,:);
    end
    if max2 == dd(k+2,3)
        cen2 = d(k+2,:);
   end 
   if max2 ==ad(k+2,3)
        cen2 = a(k+2,:);
   end  
   
   if k==1
   R1 = [125.01,750, 0]; R2 = [2874.99,750, 0];
   end
   
   if k==4
   R1 = [125.01,1500, 0]; R2 = [2874.99 ,1500, 0];
   end
   
   if k==7
   R1 = [125.01,2250, 0]; R2 = [2874.99,2250, 0];
   end
   
   melon =2;
   [X,Y] = approx_visiblity(max1, cen1, max2, cen2,h, R1, R2,melon);
    
  num = numel(X);

for i = 1:1:num;
    Z(i,1) = h;
end

   if k == 1
      U(1,:) = X; U(2,:) = Y; U(3,:) = Z;
   end
   if k == 4
       V(1,:) = X; V(2,:) = Y; V(3,:) = Z;
   end
   if k == 7
       W(1,:) = X; W(2,:) = Y; W(3,:) = Z;
   end
   %patch(X,Y,Z,'green');
   
   hold on 
   
end

[W1(1,:),W1(2,:)]= polybool('intersection',Q(1,:),Q(2,:),U(1,:),U(2,:));
[W2(1,:),W2(2,:)]= polybool('intersection',S(1,:),S(2,:),U(1,:),U(2,:));
[W3(1,:),W3(2,:)]= polybool('intersection',T(1,:),T(2,:),U(1,:),U(2,:));

[W4(1,:),W4(2,:)]= polybool('intersection',T(1,:),T(2,:),V(1,:),V(2,:));
[W5(1,:),W5(2,:)]= polybool('intersection',S(1,:),S(2,:),V(1,:),V(2,:));
[W6(1,:),W6(2,:)]= polybool('intersection',Q(1,:),Q(2,:),V(1,:),V(2,:));

[W7(1,:),W7(2,:)]= polybool('intersection',Q(1,:),Q(2,:),W(1,:),W(2,:));
[W8(1,:),W8(2,:)]= polybool('intersection',S(1,:),S(2,:),W(1,:),W(2,:));
[W9(1,:),W9(2,:)]= polybool('intersection',T(1,:),T(2,:),W(1,:),W(2,:));

i = 1;
centr = zeros([9,3]);
for i = 1:1:numel(W1(1,:))
    W1(3,:) = h;
    centr(1,1) = centr(1,1) + W1(1,i);
    centr(1,2) = centr(1,2) + W1(2,i);
    centr(1,3) = centr(1,3) + h;
end
cent(1,1) = centr(1,1)/numel(W1(1,:));
cent(1,2) = centr(1,2)/numel(W1(2,:));
cent(1,3) = centr(1,3)/numel(W1(3,:));
for i = 1:1:numel(W2(1,:))
    W2(3,:) = h;
    centr(2,1) = centr(2,1) + W2(1,i);
    centr(2,2) = centr(2,2) + W2(2,i);
    centr(2,3) = centr(2,3) + h;
end
cent(2,1) = centr(2,1)/numel(W2(1,:));
cent(2,2) = centr(2,2)/numel(W2(2,:));
cent(2,3) = centr(2,3)/numel(W2(3,:));
for i = 1:1:numel(W3(1,:))
    W3(3,:) = h;
    centr(3,1) = centr(3,1) + W3(1,i);
    centr(3,2) = centr(3,2) + W3(2,i);
    centr(3,3) = centr(3,3) + h;
end
cent(3,1) = centr(3,1)/numel(W3(1,:));
cent(3,2) = centr(3,2)/numel(W3(2,:));
cent(3,3) = centr(3,3)/numel(W3(3,:));
for i = 1:1:numel(W4(1,:))
    W4(3,:) = h;
    centr(4,1) = centr(4,1) + W4(1,i);
    centr(4,2) = centr(4,2) + W4(2,i);
    centr(4,3) = centr(4,3) + h;
end
cent(4,1) = centr(4,1)/numel(W4(1,:));
cent(4,2) = centr(4,2)/numel(W4(2,:));
cent(4,3) = centr(4,3)/numel(W4(3,:));
for i = 1:1:numel(W5(1,:))
    W5(3,:) = h;
    centr(5,1) = centr(5,1) + W5(1,i);
    centr(5,2) = centr(5,2) + W5(2,i);
    centr(5,3) = centr(5,3) + h;
end
cent(5,1) = centr(5,1)/numel(W5(1,:));
cent(5,2) = centr(5,2)/numel(W5(2,:));
cent(5,3) = centr(5,3)/numel(W5(3,:));
for i = 1:1:numel(W6(1,:))
    W6(3,:) = h;
    centr(6,1) = centr(6,1) + W6(1,i);
    centr(6,2) = centr(6,2) + W6(2,i);
    centr(6,3) = centr(6,3) + h;
end
cent(6,1) = centr(6,1)/numel(W6(1,:));
cent(6,2) = centr(6,2)/numel(W6(2,:));
cent(6,3) = centr(6,3)/numel(W6(3,:));
for i = 1:1:numel(W7(1,:))
    W7(3,:) = h;
    centr(7,1) = centr(7,1) + W7(1,i);
    centr(7,2) = centr(7,2) + W7(2,i);
    centr(7,3) = centr(7,3) + h;
end
cent(7,1) = centr(7,1)/numel(W7(1,:));
cent(7,2) = centr(7,2)/numel(W7(2,:));
cent(7,3) = centr(7,3)/numel(W7(3,:));
for i = 1:1:numel(W8(1,:))
    W8(3,:) = h;
    centr(8,1) = centr(8,1) + W8(1,i);
    centr(8,2) = centr(8,2) + W8(2,i);
    centr(8,3) = centr(8,3) + h;
end
cent(8,1) = centr(8,1)/numel(W8(1,:));
cent(8,2) = centr(8,2)/numel(W8(2,:));
cent(8,3) = centr(8,3)/numel(W8(3,:));
for i = 1:1:numel(W9(1,:))
    W9(3,:) = h;
    centr(9,1) = centr(9,1) + W9(1,i);
    centr(9,2) = centr(9,2) + W9(2,i);
    centr(9,3) = centr(9,3) + h;
end
cent(9,1) = centr(9,1)/numel(W9(1,:));
cent(9,2) = centr(9,2)/numel(W9(2,:));
cent(9,3) = centr(9,3)/numel(W9(3,:));


%{
patch(W1(1,:),W1(2,:),W1(3,:),'green');hold on

patch(W2(1,:),W2(2,:),W2(3,:),'green');hold on

patch(W3(1,:),W3(2,:),W3(3,:),'green');hold on

patch(W4(1,:),W4(2,:),W4(3,:),'green');hold on

patch(W5(1,:),W5(2,:),W5(3,:),'green');hold on

patch(W6(1,:),W6(2,:),W6(3,:),'green');hold on

patch(W7(1,:),W7(2,:),W7(3,:),'green');hold on

patch(W8(1,:),W8(2,:),W8(3,:),'green');hold on

patch(W9(1,:),W9(2,:),W9(3,:),'green');

%}



x_a_0 = 0;
y_a_0 = 0;
chi_a_0 = pi/6;

global k vt va r TIME 
 
k = 3;
vt = 18;
va = 25;
r=  0.5;
TIME = [];

fifa = 1;

while fifa < 100

if(mod(fifa,2) ~= 0)
for u = 1:4:9

ud = u;


x_t_0 = cent(ud,1);
y_t_0 = cent(ud,2);
chi_t_0 = pi/2;

t = ( ( (x_t_0 - x_a_0)^2 + (y_t_0 - y_a_0)^2)^0.5) / va;

tspan = [0,t];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;target_pos_0(1,1);target_pos_0(1,2)];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('target_los_infinity',tspan,z0,options);

x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);

target_pos_x = z(:,7);target_pos_y = z(:,8);

len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

i = 1;
gta = 0;

if(u == 1)
    hd1 = patch(Q(1,:),Q(2,:),Q(3,:),'green');
    hold on
    hd2 = patch(U(1,:),U(2,:),U(3,:),'green');
end

if(u == 5)
    hd1 = patch(S(1,:),S(2,:),S(3,:),'green');
    hold on
    hd2 = patch(V(1,:),V(2,:),V(3,:),'green');
end

if(u == 9)
    hd1 = patch(T(1,:),T(2,:),T(3,:),'green');
    hold on
    hd2 = patch(W(1,:),W(2,:),W(3,:),'green');
end

set(gcf,'Renderer','zbuffer'); 
while i<=length(x_t)
    plot3(target_pos_x(i),target_pos_y(i),0,'b');
    hold on
    plot3(x_a(i),y_a(i),h_uav(i),'r');
    hold on
    check = search_infinity(x_a(i),y_a(i), target_pos_x(i), target_pos_y(i),a(ud,:),b(ud,:),c(ud,:),d(ud,:),Q,S,T,U,V,W,ud,h,sensor_range);
    if(check == 1)
        disp('Eureka!! Target Found');
         plot3(x_a(i), y_a(i),h,'o','MarkerSize',8,'MarkerFaceColor','magenta');
        gta = 7;
        break;
    end
    axis([0 3000 0 3000]);
    drawnow ;
    i = i+1;
end

delete(hd1);
delete(hd2);

if(gta == 7)
    icc = 1;
    break;
end

x_a_0 = x_a(i-1);
y_a_0 = y_a(i-1);
chi_a_0 = chi_a(i-1);

target_pos_0(1,1) = target_pos_x(i-1);
target_pos_0(1,2) = target_pos_y(i-1);
chi_t_0 = chi_t(i-1);

hold on 
end

if(icc == 1)
    bat = 1;
    break;
end

else
    for u = 5:-4:1

ud = u;

x_t_0 = cent(ud,1);
y_t_0 = cent(ud,2);
chi_t_0 = 0;

t = ( ( (x_t_0 - x_a_0)^2 + (y_t_0 - y_a_0)^2)^0.5) / va;

tspan = [0,t];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;target_pos_0(1,1);target_pos_0(1,2)];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('target_los_infinity',tspan,z0,options);

x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);

target_pos_x = z(:,7);target_pos_y = z(:,8);

len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

i = 1;
gta = 0;

if(u == 1)
    hd1 = patch(Q(1,:),Q(2,:),Q(3,:),'green');
    hold on
    hd2 = patch(U(1,:),U(2,:),U(3,:),'green');
end

if(u == 5)
    hd1 = patch(S(1,:),S(2,:),S(3,:),'green');
    hold on
    hd2 = patch(V(1,:),V(2,:),V(3,:),'green');
end

if(u == 9)
    hd1 = patch(T(1,:),T(2,:),T(3,:),'green');
    hold on
    hd2 = patch(W(1,:),W(2,:),W(3,:),'green');
end


set(gcf,'Renderer','zbuffer'); 
while i<=length(x_t)
    plot3(target_pos_x(i),target_pos_y(i),0,'b');
    hold on
    plot3(x_a(i),y_a(i),h_uav(i),'r');
    hold on
    check = search_infinity(x_a(i),y_a(i), target_pos_x(i), target_pos_y(i),a(ud,:),b(ud,:),c(ud,:),d(ud,:),Q,S,T,U,V,W,ud,h,sensor_range);
    if(check == 1)
        disp('Eureka!! Target Found');
        plot3(x_a(i), y_a(i),h,'o','MarkerSize',8,'MarkerFaceColor','magenta');
        gta = 7;
        break;
    end
    axis([0 3000 0 3000]);
    drawnow ;
    i = i+1;
end

delete(hd1);
delete(hd2);

if(gta == 7)
    icc = 1;
    break;
end

x_a_0 = x_a(i-1);
y_a_0 = y_a(i-1);
chi_a_0 = chi_a(i-1);

target_pos_0(1,1) = target_pos_x(i-1);
target_pos_0(1,2) = target_pos_y(i-1);
chi_t_0 = chi_t(i-1);

hold on 
    end
if(icc == 1)
    bat = 1;
    break;
end

end

fifa = fifa + 1;

if(bat == 1)
    break;
end

end

x_a_0 = x_a(i-1);
y_a_0 = y_a(i-1);
chi_a_0 = chi_a(i-1);

target_pos_0(1,1) = target_pos_x(i-1);
target_pos_0(1,2) = target_pos_y(i-1);
%chi_t_0 = chi_t(i-1);

chi_t_0 = 3*pi/2;

tspan1 = [0,40];
z0_g = [target_pos_0(1,1);target_pos_0(1,2);chi_t_0;x_a_0;y_a_0;chi_a_0;];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('los_4_infinity',tspan1,z0_g,options);

target_pos_x = z(:,1);target_pos_y = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);


len1 = length(target_pos_x);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

jk = 1;

while jk<=length(target_pos_x)  
    plot3(target_pos_x(jk),target_pos_y(jk),0,'b');
    hold on
    plot3(x_a(jk),y_a(jk),h_uav(i),'magenta');
    hold on
    pause(0.01); 
    jk = jk+1;
end
