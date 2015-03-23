clc;clear all;
close all;

rotate3d;
h = 600;%input('Enter the height of UAV: ');
const1 = 0;const2 = 1500;

color = 1;

R = [800,1175,0];%input('Enter the point on the road: ');

wr = 125;
wrs = 125;

figure(1)
plot3(R(1,1),R(1,2),0,'-x');
hold on

ad = [300,200,300];%input('Enter [l,w,h] of 1st building: ');
bd = [400,300,400];%input('Enter [l,w,h] of 2nd 1building: ');
cd = [300,200,200];%input('Enter [l,w,h] of 3rd building: ');

a = [600,1225,0];%input('Enter centre of building: ');
b = [550,750,0];
c = [600,275,0];

la = ad(1,1);wa = ad(1,2);ha = ad(1,3);

lb = bd(1,1);wb = bd(1,2);hb = bd(1,3);

lc = cd(1,1);wc = cd(1,2);hc = cd(1,3);

a_1 = a + [wa/2,la/2,ha];a_1g = a_1 - [0,0,ha];
a_2 = a + [wa/2,-la/2,ha];a_2g = a_2 - [0,0,ha];
a_3 = a + [-wa/2,-la/2,ha];a_3g = a_3 - [0,0,ha];
a_4 = a + [-wa/2,la/2,ha];a_4g = a_4 - [0,0,ha];

b_1 = b + [wb/2,lb/2,hb];b_1g = b_1 - [0,0,hb];
b_2 = b + [wb/2,-lb/2,hb];b_2g = b_2 - [0,0,hb];
b_3 = b + [-wb/2,-lb/2,hb];b_3g = b_3 - [0,0,hb];
b_4 = b + [-wb/2,lb/2,hb];b_4g = b_4 - [0,0,hb];

c_1 = c + [wc/2,lc/2,hc];c_1g = c_1 - [0,0,hc];
c_2 = c + [wc/2,-lc/2,hc];c_2g = c_2 - [0,0,hc];
c_3 = c + [-wc/2,-lc/2,hc];c_3g = c_3 - [0,0,hc];
c_4 = c + [-wc/2,lc/2,hc];c_4g = c_4 - [0,0,hc];

P1 = [0,0,h];
P2 = [10,9,h];
P3 = [25,27,h];

normal = cross(P1-P2,P2-P3);
normal2 = cross(R - a_1,a_1 - a_1g);
normal3 = cross(R - a_2,a_2 - a_2g);
normal10 = cross(R - a_3,a_3 - a_3g);
normal4 = cross(R - b_1,b_1 - b_1g);
normal5 = cross(R - b_2,b_2 - b_2g);
normal11 = cross(R - b_3,b_3 - b_3g);
normal6 = cross(R - b_4,b_4 - b_4g);
normal7 = cross(R - c_1,c_1 - c_1g);
normal8 = cross(R - c_2,c_2 - c_2g);
normal9 = cross(R - c_4,c_4 - c_4g);
syms x y z
P = [x,y,z];
%{
normal = dot(normal,P-P1)/45;
normal2 = dot(normal2,P-R)/45;
normal3 = dot(normal3,P-R)/45;
normal4 = dot(normal4,P-R)/45;
normal5 = dot(normal5,P-R)/45;
normal6 = dot(normal6,P-R)/45;
normal7 = dot(normal7,P-R)/45;
normal8 = dot(normal8,P-R)/45;
normal9 = dot(normal9,P-R)/45;
%}


[p1_dash,ch1] = plane_line_intersect(normal2,R,[0,1500,0],[1500,1500,0]);
[p1,ch2] = plane_line_intersect(normal,P1,R,a_1);
[p2,ch3] = plane_line_intersect(normal,P1,R,a_2);
[p2_dash,ch4] = plane_line_intersect(normal3,R,[0,0,0],[0,1500,0]);
[p9_dash,ch17] = plane_line_intersect(normal10,R,[0,1500,0],[1500,1500,0]);
[p9,ch18] = plane_line_intersect(normal,P1,R,a_3);

[p3_dash,ch5] = plane_line_intersect(normal4,R,[0,0,0],[0,1500,0]);
[p3,ch6] = plane_line_intersect(normal,P1,R,b_1);
[p4_dash,ch7] = plane_line_intersect(normal5,R,[0,0,0],[1500,0,0]);
[p4,ch8] = plane_line_intersect(normal,P1,R,b_2);
[p10_dash,ch19] = plane_line_intersect(normal11,R,[0,0,0],[0,1500,0]);
[p10,ch20] = plane_line_intersect(normal,P1,R,b_3);
[p5_dash,ch9] = plane_line_intersect(normal6,R,[0,0,0],[0,1500,0]);
[p5,ch10] = plane_line_intersect(normal,P1,R,b_4);

[p6_dash,ch11] = plane_line_intersect(normal7,R,[0,0,0],[0,1500,0]);
[p6,ch12] = plane_line_intersect(normal,P1,R,c_1);
[p7_dash,ch13] = plane_line_intersect(normal8,R,[0,0,0],[1500,0,0]);
[p7,ch14] = plane_line_intersect(normal,P1,R,c_2);
[p8_dash,ch15] = plane_line_intersect(normal9,R,[0,0,0],[1500,0,0]);
[p8,ch16] = plane_line_intersect(normal,P1,R,c_4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(R(1,2) < 1375 && R(1,2) >=1075)

    Pa = double([p1_dash(1,1) p1(1,1) p2(1,1) p2_dash(1,1) 0 1500 1500 0]);
    Qa = double([p1_dash(1,2) p1(1,2) p2(1,2) p2_dash(1,2) 0 0 1500 1500]);
    Pb = double([p5_dash(1,1) p5(1,1) p3(1,1) p4(1,1) p4_dash(1,1) 1500 1500 0 0]);
    Qb = double([p5_dash(1,2) p5(1,2) p3(1,2) p4(1,2) p4_dash(1,2) 0 1500 1500 0]);
    Pc = double([p8_dash(1,1) p8(1,1) p6(1,1) p7(1,1) p7_dash(1,1) 1500 1500 0 0]);
    Qc = double([p8_dash(1,2) p8(1,2) p6(1,2) p7(1,2) p7_dash(1,2) 0 1500 1500 0]);
   for k = 1:length(Pa)
    Ta(k,1) = h;
    end
    if(color == 1)
    figure(1);
    patch(Pa,Qa,Ta,'red','FaceAlpha',0,'EdgeColor','red','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
    for k = 1:length(Pb)
    Tb(k,1) = h;
    end
    if(color == 2)
    figure(1);
    patch(Pb,Qb,Tb,'green','FaceAlpha',0,'EdgeColor','green','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
     for k = 1:length(Pc)
    Tc(k,1) = h;
     end
     if(color == 3)
     figure(1);
     patch(Pc,Qc,Tc,'blue','FaceAlpha',0,'EdgeColor','blue','LineWidth',3);
     axis([0 1500 0 1500]);
     end
    hold on

   [Pn,Qn] = polybool('intersection',Pa,Qa,Pb,Qb);
   [P,Q] = polybool('intersection',Pn,Qn,Pc,Qc);
   axis([0 1500 0 1500]);

for k = 1:length(P)
    T(k,1) = h;
end
figure(1)
%patch(P,Q,T,'green');
hold on 

figure(1)
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);

axis([0 1500 0 1500]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(R(1,2) <= 950 && R(1,2) >= 550)
    
    Pa = double([p9_dash(1,1) p9(1,1) p2(1,1) p1(1,1) p1_dash(1,1) 1500 1500 0 0]);
    Qa = double([p9_dash(1,2) p9(1,2) p2(1,2) p1(1,2) p1_dash(1,2) 1500 0 0 1500]);
    Pb = double([p3_dash(1,1) p3(1,1) p4(1,1) p4_dash(1,1) 0 1500 1500 0]);
    Qb = double([p3_dash(1,2) p3(1,2) p4(1,2) p4_dash(1,2) 0 0 1500 1500]);
    Pc = double([p8_dash(1,1) p8(1,1) p6(1,1) p7(1,1) p7_dash(1,1) 1500 1500 0 0]);
    Qc = double([p8_dash(1,2) p8(1,2) p6(1,2) p7(1,2) p7_dash(1,2) 0 1500 1500 0]);
   for k = 1:length(Pa)
    Ta(k,1) = h;
    end
    if(color == 1)
    figure(1);
    patch(Pa,Qa,Ta,'red','FaceAlpha',0,'EdgeColor','red','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
    for k = 1:length(Pb)
    Tb(k,1) = h;
    end
    if(color == 2)
    figure(1);
    patch(Pb,Qb,Tb,'green','FaceAlpha',0,'EdgeColor','green','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
     for k = 1:length(Pc)
    Tc(k,1) = h;
     end
     if(color == 3)
     figure(1);
     patch(Pc,Qc,Tc,'blue','FaceAlpha',0,'EdgeColor','blue','LineWidth',3);
     axis([0 1500 0 1500]);
     end
    hold on
    [Pn,Qn] = polybool('intersection',Pa,Qa,Pb,Qb);
    [P,Q] = polybool('intersection',Pn,Qn,Pc,Qc);

for k = 1:length(P)
    T(k,1) = h;
end

figure(1)
%patch(P,Q,T,'green');
hold on 

figure(1)
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);

axis([0 1500 0 1500]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(R(1,2) <= 425 && R(1,2) > 125)
    
    Pa = double([p9_dash(1,1) p9(1,1) p2(1,1) p1(1,1) p1_dash(1,1) 1500 1500 0 0]);
    Qa = double([p9_dash(1,2) p9(1,2) p2(1,2) p1(1,2) p1_dash(1,2) 1500 0 0 1500]);
    Pb = double([p3_dash(1,1) p3(1,1) p4(1,1) p10(1,1) p10_dash(1,1) 0 1500 1500 0]);
    Qb = double([p3_dash(1,2) p3(1,2) p4(1,2) p10(1,2) p10_dash(1,2) 0 0 1500 1500]);
    Pc = double([p6_dash(1,1) p6(1,1) p7(1,1) p7_dash(1,1) 1500 1500 0 0]);
    Qc = double([p6_dash(1,2) p6(1,2) p7(1,2) p7_dash(1,2) 0 1500 1500 0]);
   for k = 1:length(Pa)
    Ta(k,1) = h;
    end
    if(color == 1)
    figure(1);
    patch(Pa,Qa,Ta,'red','FaceAlpha',0,'EdgeColor','red','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
    for k = 1:length(Pb)
    Tb(k,1) = h;
    end
    if(color == 2)
    figure(1);
    patch(Pb,Qb,Tb,'green','FaceAlpha',0,'EdgeColor','green','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
     for k = 1:length(Pc)
    Tc(k,1) = h;
     end
     if(color == 3)
     figure(1);
     patch(Pc,Qc,Tc,'blue','FaceAlpha',0,'EdgeColor','blue','LineWidth',3);
     axis([0 1500 0 1500]);
     end
    hold on
    [Pn,Qn] = polybool('intersection',Pa,Qa,Pb,Qb);
    [P,Q] = polybool('intersection',Pn,Qn,Pc,Qc);

for k = 1:length(P)
    T(k,1) = h;
end

figure(1)
%patch(P,Q,T,'green');
hold on 

figure(1)
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);

axis([0 1500 0 1500]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(R(1,2) < 1075 && R(1,2) > 950)
    
    Pa = double([p9_dash(1,1) p9(1,1) p2(1,1) p1(1,1) p1_dash(1,1) 1500 1500 0 0]);
    Qa = double([p9_dash(1,2) p9(1,2) p2(1,2) p1(1,2) p1_dash(1,2) 1500 0 0 1500]);
    Pb = double([p5_dash(1,1) p5(1,1) p3(1,1) p4(1,1) p4_dash(1,1) 0 1500 1500 0]);
    Qb = double([p5_dash(1,2) p5(1,2) p3(1,2) p4(1,2) p4_dash(1,2) 0 0 1500 1500]);
    Pc = double([p8_dash(1,1) p8(1,1) p6(1,1) p7(1,1) p7_dash(1,1) 1500 1500 0 0]);
    Qc = double([p8_dash(1,2) p8(1,2) p6(1,2) p7(1,2) p7_dash(1,2) 0 1500 1500 0]);
   for k = 1:length(Pa)
    Ta(k,1) = h;
    end
    if(color == 1)
    figure(1);
    patch(Pa,Qa,Ta,'red','FaceAlpha',0,'EdgeColor','red','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
    for k = 1:length(Pb)
    Tb(k,1) = h;
    end
    if(color == 2)
    figure(1);
    patch(Pb,Qb,Tb,'green','FaceAlpha',0,'EdgeColor','green','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
     for k = 1:length(Pc)
    Tc(k,1) = h;
     end
     if(color == 3)
     figure(1);
     patch(Pc,Qc,Tc,'blue','FaceAlpha',0,'EdgeColor','blue','LineWidth',3);
     axis([0 1500 0 1500]);
     end
    hold on
    [Pn,Qn] = polybool('intersection',Pa,Qa,Pb,Qb);
    [P,Q] = polybool('intersection',Pn,Qn,Pc,Qc);

for k = 1:length(P)
    T(k,1) = h;
end

figure(1)
%patch(P,Q,T,'green');
hold on 

figure(1)
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);

axis([0 1500 0 1500]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(R(1,2) < 550 && R(1,2) > 425)
    
    Pa = double([p9_dash(1,1) p9(1,1) p2(1,1) p1(1,1) p1_dash(1,1) 1500 1500 0 0]);
    Qa = double([p9_dash(1,2) p9(1,2) p2(1,2) p1(1,2) p1_dash(1,2) 1500 0 0 1500]);
    Pb = double([p10_dash(1,1) p10(1,1) p4(1,1) p3(1,1) p3_dash(1,1) 1500 1500 0 0]);
    Qb = double([p10_dash(1,2) p10(1,2) p4(1,2) p3(1,2) p3_dash(1,2) 1500 0 0 1500]);
    Pc = double([p8_dash(1,1) p8(1,1) p6(1,1) p7(1,1) p7_dash(1,1) 1500 1500 0 0]);
    Qc = double([p8_dash(1,2) p8(1,2) p6(1,2) p7(1,2) p7_dash(1,2) 0 1500 1500 0]);
   for k = 1:length(Pa)
    Ta(k,1) = h;
    end
    if(color == 1)
    figure(1);
    patch(Pa,Qa,Ta,'red','FaceAlpha',0,'EdgeColor','red','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
    for k = 1:length(Pb)
    Tb(k,1) = h;
    end
    if(color == 2)
    figure(1);
    patch(Pb,Qb,Tb,'green','FaceAlpha',0,'EdgeColor','green','LineWidth',3);
    axis([0 1500 0 1500]);
    color = color + 1;
    end
    hold on
     for k = 1:length(Pc)
    Tc(k,1) = h;
     end
     if(color == 3)
     figure(1);
     patch(Pc,Qc,Tc,'blue','FaceAlpha',0,'EdgeColor','blue','LineWidth',3);
     axis([0 1500 0 1500]);
     end
    hold on
    [Pn,Qn] = polybool('intersection',Pa,Qa,Pb,Qb);
    [P,Q] = polybool('intersection',Pn,Qn,Pc,Qc);

for k = 1:length(P)
    T(k,1) = h;
end

figure(1)
%patch(P,Q,T,'green');
hold on 

figure(1)
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);

axis([0 1500 0 1500]);
end