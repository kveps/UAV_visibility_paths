clc;clear all;
n = 2;% input('Enter number of buildings in urban environment: ');
%rotate3d;
wr = 50;
z = 1500;
const1 = 0;const2 = 1500;
R = [750,750,0];%input('Enter the point on the road: ');
a = [0,750,0];%input('Enter centre of building: ');
ad = [300,200,180];%input('Enter [l,w,h] of building: ');

a(1,1) = 750 + (wr/2) + (ad(1,2)/2);
la = ad(1,1);wa = ad(1,2);ha = ad(1,3);

a1 = a + [wa/2,la/2,ha];
a2 = a + [wa/2,-la/2,ha];
a3 = a + [-wa/2,-la/2,ha];
a4 = a + [-wa/2,la/2,ha];
b =  [0,750,0];%input('Enter centre of building: ');
bd = [300,200,80];%input('Enter [l,w,h] of building: ');
b(1,1) = 750 - (wr/2) - (bd(1,2)/2);

lb = bd(1,1);wb = bd(1,2);hb = bd(1,3);
b1 = b + [wb/2,lb/2,hb];
b2 = b + [wb/2,-lb/2,hb];
b3 = b + [-wb/2,-lb/2,hb];
b4 = b + [-wb/2,lb/2,hb];

%a = [0,750,0];%input('Enter centre of building: ');
%b = [0,750,0];



P1(1,1) = R(1,1) + (a4(1,1) - R(1,1))*((const2 - R(1,2))/(a4(1,2) - R(1,2)));P1(1,2) = const2;
P2(1,1) = R(1,1) + (a4(1,1) - R(1,1))*(z/ha);P2(1,2) = R(1,2) + (a4(1,2) - R(1,2))*(z/ha);
P3(1,1) = R(1,1) + (a3(1,1) - R(1,1))*(z/ha);P3(1,2) = R(1,2) + (a3(1,2) - R(1,2))*(z/ha);
P4(1,1) = R(1,1) + (a3(1,1) - R(1,1))*((const1 - R(1,2))/(a3(1,2) - R(1,2)));P4(1,2) = const1;
P5(1,1) = R(1,1) + (b2(1,1) - R(1,1))*((const1 - R(1,2))/(b2(1,2) - R(1,2)));P5(1,2) = const1;
P6(1,1) = R(1,1) + (b2(1,1) - R(1,1))*(z/hb);P6(1,2) = R(1,2) + (b2(1,2) - R(1,2))*(z/hb);
P7(1,1) = R(1,1) + (b1(1,1) - R(1,1))*(z/hb);P7(1,2) = R(1,2) + (b1(1,2) - R(1,2))*(z/hb);
P8(1,1) = R(1,1) + (b1(1,1) - R(1,1))*((const2 - R(1,2))/(b1(1,2) - R(1,2)));P8(1,2) = const2;


X = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];




num = numel(X);
for po=1:1:num;
    Z(po,1) = z;
end

patch(X,Y,Z,'green');
axis([const1 const2 const1 const2]);
axis('square');

hold on
voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);