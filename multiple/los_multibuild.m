clc;clear all;
close all;
n = 6;% input('Enter number of buildings in urban environment: ');

rotate3d;

h = 600;%input('Enter the height of UAV: ');
const1 = 0;const2 = 1500;

b1 = [300,400,300];
b2 = [300,400,300];
b3 = [300,400,300];
b4 = [300,400,400];
b5 = [300,400,400];
b6 = [300,400,400];

R = [750,0,0];%input('Enter the point on the road: ');
wr = 200;%input('Enter width of the road: ');

%plot3(R(1,1),R(1,2),0,'-x');

for i=1:1:2

if i == 1
ad = b1;%input('Enter [l,w,h] of 1st building: ');
bd = b2;%input('Enter [l,w,h] of 2nd 1building: ');
cd = b5;%input('Enter [l,w,h] of 1st building: ');
dd = b6;%input('Enter [l,w,h] of 2nd 1building: ');
end

if i == 2
ad = b2;%input('Enter [l,w,h] of 1st building: ');
bd = b3;%input('Enter [l,w,h] of 2nd 1building: ');
cd = b4;%input('Enter [l,w,h] of 1st building: ');
dd = b5;%input('Enter [l,w,h] of 2nd 1building: ');
end

a(1,1) = 1125;
b(1,1) = 1125;
c(1,1) = 375;
d(1,1) = 375;

a(1,2) = 1125;
b(1,2) = 375;
c(1,2) = 375;
d(1,2) = 1125;

a(1,3) = 0;
b(1,3) = 0;
c(1,3) = 0;
d(1,3) = 0;

la = ad(1,1);wa = ad(1,2);ha = ad(1,3);

lb = bd(1,1);wb = bd(1,2);hb = bd(1,3);

lc = cd(1,1);wc = cd(1,2);hc = cd(1,3);

ld = dd(1,1);wd = dd(1,2);hd = dd(1,3);

wrs = 375-(la/2) + 375 - (lb/2);


R(1,2) = 1125 + (la/2) - 0.00001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(1125 -(la/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd);P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd);P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X1 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y1 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z1 = [h h h h h h h h ];

end

R(1,2) = 1125 - (la/2) + 0.00001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(1125 -(la/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd);P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd);P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X2 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y2 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z2 = [h h h h h h h h];

end


R(1,2) = 375 + (lb/2) - 0.00001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const2;

X3 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y3 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z3 = [h h h h h h h h];

end

R(1,2) = 375 - (lb/2) + 0.00001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const2;

X4 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y4 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z4 = [h h h h h h h h];

end

R(1,2) = 1125 + (la/2) - 0.00001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) =R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*(h/hb);P4(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P5(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P6(1,2) = const1;

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*(h/hc);P8(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P9(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P9(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P10(1,1) = const1;P10(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));


X9 = [1500 P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1) P9(1,1) P10(1,1) 0];
Y9 = [1500 P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2) P9(1,2) P10(1,2) 1500];
Z9 = [h h h h h h h h h h h h];

end

R(1,2) = 375 + (lb/2) - 0.00001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (wrs/2)*(h/ha);

P4(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P4(1,2) = R(1,2) + (wrs/2)*(h/ha);

P5(1,1) = const2; P5(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 +(wa/2) - R(1,1)));

P6(1,1) = const1;P6(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P7(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*(h/hd);P8(1,2) = R(1,2) + (wrs/2)*(h/hd);

P9(1,1) = R(1,1) + (-wr/2)*(h/hd);P9(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P10(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P10(1,2) = const2;

X10 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) 1500 0 P6(1,1) P7(1,1) P8(1,1) P9(1,1) P10(1,1)];
Y10 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) 0 0 P6(1,2) P7(1,2) P8(1,2) P9(1,2) P10(1,2)];
Z10 = [h h h h h h h h h h h h];

end

R(1,2) = 1125 + (la/2) - 0.00001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const1;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const1;

X13 = [1500 1500 P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1) 0 0];
Y13 = [1500 0 P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2) 0 1500];
Z13 = [h h h h h h h h h h h h];

end

R(1,2) = 375 - (lb/2) + 0.00001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125 -(la/2) - R(1,2)));P4(1,2) = const2;

P5(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const2;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd);P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd);P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X14 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) 1500 1500 0 0 P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y14 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) 1500 0 0 1500 P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z14 = [h h h h h h h h h h h h];

end






R(1,2) = 750; 

R(1,1) = 1000 + (wb/2) -0.000001;

if (R(1,1)<1000+(wa/2)) && (R(1,1)>=1000-(wa/2)) && (R(1,1)<=1000+(wb/2)) && (R(1,1)>=1000-(wb/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1000+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1000+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1000 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(1000 -(wb/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(1000 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1000 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1000 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1000 +(wa/2) - R(1,1)));

X5 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y5 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z5 = [h h h h h h h h];

end

R(1,1) = 1000 - (wb/2) + 0.00001;

if (R(1,1)<1000+(wa/2)) && (R(1,1)>=1000-(wa/2)) && (R(1,1)<=1000+(wb/2)) && (R(1,1)>=1000-(wb/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1000+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1000+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1000 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(1000 -(wb/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(1000 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1000 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1000 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1000 +(wa/2) - R(1,1)));

X6 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y6 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z6 = [h h h h h h h h];

end


R(1,1) = 450 + (wc/2) -0.000001;

if (R(1,1)<=450+(wc/2)) && (R(1,1)>=450-(wc/2)) && (R(1,1)<=450+(wd/2)) && (R(1,1)>=450-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(450+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (450+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (450 - (wc/2) - R(1,1))*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(450 -(wc/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(450 -(wd/2) - R(1,1)));

P6(1,1) = R(1,1) + (450 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (450 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(450 +(wd/2) - R(1,1)));

X7 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y7 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z7 = [h h h h h h h h];

end


R(1,1) = 450 - (wc/2) + 0.000001;

if (R(1,1)<=450+(wc/2)) && (R(1,1)>=450-(wc/2)) && (R(1,1)<=450+(wd/2)) && (R(1,1)>=450-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(450+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (450+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (450 - (wc/2) - R(1,1))*(h/hc);P3(1,2) =  R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = R(1,1) + (450 - (wc/2) - R(1,1))*(h/hc);P4(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P5(1,1) = const1;P5(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(450 -(wc/2) - R(1,1)));

P6(1,1) = R(1,1) + (450 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (450 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(450 +(wd/2) - R(1,1)));

X8 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y8 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z8 = [h h h h h h h h];

end

R(1,1) = 1000 - (wb/2) + 0.000001;

if (R(1,1)<1000+(wa/2)) && (R(1,1)>=1000-(wa/2)) && (R(1,1)<=1000+(wb/2)) && (R(1,1)>=1000-(wb/2)) 

P1(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(450 -(lc/2) - R(1,2)));P1(1,2) = const1;

P2(1,1) = R(1,1) + (-wr/2)*(h/hc);P2(1,2) = R(1,2) + (450 -(lc/2) - R(1,2))*(h/hc);

P3(1,1) = R(1,1) + (-wr/2)*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(1000 -(wb/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(1000 -(wa/2) - R(1,1)));

P6(1,1) = const1;P6(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(450 -(wd/2) - R(1,1)));

P7(1,1) = R(1,1) + (450 -(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*(h/hd); P8(1,2) = R(1,2) + (wrs/2)*(h/hd);

P9(1,1) = R(1,1) + (-wr/2)*(h/hd);P9(1,2) = R(1,2) + (1000 +(ld/2) - R(1,2))*(h/hd);

P10(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1000 +(ld/2) - R(1,2)));P10(1,2) = const2;

X11 = [1500 P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1) P9(1,1) P10(1,1) 1500];
Y11 = [0 P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2) P9(1,2) P10(1,2) 1500];
Z11 = [h h h h h h h h h h h h];

end

R(1,1) = 450 + (wc/2) - 0.000001;

if (R(1,1)<=450+(wc/2)) && (R(1,1)>=450-(wc/2)) && (R(1,1)<=450+(wd/2)) && (R(1,1)>=450-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1000+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1000+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) =  R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*(h/hb);P4(1,2) = R(1,2) + (450 - (lb/2) - R(1,2))*(h/hb);

P5(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(450 -(lb/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1000+(la/2) - R(1,2)));P6(1,2) = const2;

P7(1,1) = R(1,1) + (wr/2)*(h/ha);P7(1,2) = R(1,2) + (1000+(la/2)- R(1,2))*(h/ha);

P8(1,1) = R(1,1) + (wr/2)*(h/ha); P8(1,2) = R(1,2) + (wrs/2)*(h/ha);

P9(1,1) = R(1,1) + (1000 +(wa/2) - R(1,1))*(h/ha);P9(1,2) = R(1,2) + (wrs/2)*(h/ha);

P10(1,1) = const2; P10(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1000 +(wa/2) - R(1,1)));

X12 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) 0 0 P6(1,1) P7(1,1) P8(1,1) P9(1,1) P10(1,1)];
Y12 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) 0 1500 P6(1,2) P7(1,2) P8(1,2) P9(1,2) P10(1,2)];
Z12 = [h h h h h h h h h h h h];

end

R(1,1) = 1000 + (wb/2) -0.000001;

if (R(1,1)<=1000 + (wb/2)) && (R(1,1)>=1000-(wb/2)) && (R(1,1)<=1000+(wa/2)) && (R(1,1)>=1000-(wa/2)) 

P1(1,1) = const1; P1(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(450+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (450+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (450 - (wc/2) - R(1,1))*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(450 -(wc/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(450 -(wd/2) - R(1,1)));

P6(1,1) = R(1,1) + (450 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (450 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const1; P8(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(450 +(wd/2) - R(1,1)));

X15 = [1500 0 P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1) 0 1500];
Y15 = [0 0 P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2) 1500 1500];
Z15 = [h h h h h h h h h h h h];

end

R(1,1) = 450 - (wc/2) + 0.00001;

if (R(1,1)<450+(wc/2)) && (R(1,1)>=450-(wc/2)) && (R(1,1)<=450+(wd/2)) && (R(1,1)>=450-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1000+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1000+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1000 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const2;P4(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1000 -(wb/2) - R(1,1)));

P5(1,1) = const2;P5(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1000 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1000 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1000 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1000 +(wa/2) - R(1,1)));

X16 = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) 1500 0 0 1500 P5(1,1) P6(1,1) P7(1,1) P8(1,1)];
Y16 = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) 0 0 1500 1500 P5(1,2) P6(1,2) P7(1,2) P8(1,2)];
Z16 = [h h h h h h h h h h h h];

end












R(1,1) = 750; R(1,2) = 750;
 
P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (wrs/2)*(h/ha);

P4(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P4(1,2) = R(1,2) + (wrs/2)*(h/ha);

P5(1,1) = const2; P5(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 +(wa/2) - R(1,1)));

P6(1,1) = const2; P6(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125+(wb/2)- R(1,1)));

P7(1,1) = R(1,1) + (1125+(wb/2)- R(1,1))*(h/hb);P7(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P8(1,1) = R(1,1) + (wr/2)*(h/hb); P8(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P9(1,1) = R(1,1) + (wr/2)*(h/hb);P9(1,2) = R(1,2) + (450 - (lb/2) - R(1,2))*(h/hb);

P10(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(450 -(lb/2) - R(1,2)));P10(1,2) = const1;

P11(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(450 -(lc/2) - R(1,2)));P11(1,2) = const1;

P12(1,1) = R(1,1) + (-wr/2)*(h/hc);P12(1,2) = R(1,2) + (450 -(lc/2) - R(1,2))*(h/hc);

P13(1,1) = R(1,1) + (-wr/2)*(h/hc);P13(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P14(1,1) = R(1,1) + (450 - (wc/2) - R(1,1))*(h/hc);P14(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P15(1,1) = const1;P15(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P16(1,1) = const1;P16(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P17(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P17(1,2) = R(1,2) + (wrs/2)*(h/hd);

P18(1,1) = R(1,1) + (-wr/2)*(h/hd);P18(1,2) = R(1,2) + (wrs/2)*(h/hd); 

P19(1,1) = R(1,1) + (-wr/2)*(h/hd);P19(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P20(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P20(1,2) = const2;

Xcen = [P1(1,1) P2(1,1) P3(1,1) P4(1,1) P5(1,1) P6(1,1) P7(1,1) P8(1,1) P9(1,1) P10(1,1) P11(1,1) P12(1,1) P13(1,1) P14(1,1) P15(1,1) P16(1,1) P17(1,1) P18(1,1) P19(1,1) P20(1,1) ];
Ycen = [P1(1,2) P2(1,2) P3(1,2) P4(1,2) P5(1,2) P6(1,2) P7(1,2) P8(1,2) P9(1,2) P10(1,2) P11(1,2) P12(1,2) P13(1,2) P14(1,2) P15(1,2) P16(1,2) P17(1,2) P18(1,2) P19(1,2) P20(1,2) ];
Zcen = [h h h h h h h h h h h h h h h h h h h h];

[Xa,Ya] = polybool('intersection',X1,Y1,X2,Y2);
[Xb,Yb] = polybool('intersection',X3,Y3,X4,Y4);
[Xc,Yc] = polybool('intersection',X5,Y5,X6,Y6);
[Xd,Yd] = polybool('intersection',X7,Y7,X8,Y8);
[Xe,Ye] = polybool('intersection',Xa,Ya,Xb,Yb);
[Xf,Yf] = polybool('intersection',Xc,Yc,Xd,Yd);
[Xg,Yg] =  polybool('intersection',Xe,Ye,Xf,Yf);
[Xh,Yh] =  polybool('intersection',X9,Y9,X10,Y10);
[Xi,Yi] =  polybool('intersection',X11,Y11,X12,Y12);
[Xj,Yj] =  polybool('intersection',Xh,Yh,Xi,Yi);
[Xk,Yk] =  polybool('intersection',Xg,Yg,Xj,Yj);
[Xl,Yl] =  polybool('intersection',X13,Y13,X14,Y14);
[Xm,Ym] =  polybool('intersection',X15,Y15,X16,Y16);
[Xn,Yn] =  polybool('intersection',Xl,Yl,Xm,Ym);
[Xp,Yp] =  polybool('intersection',Xn,Yn,Xk,Yk);

[X,Y] = polybool('intersection',Xp,Yp,Xcen,Ycen);

num = numel(X);

for too = 1:1:num;
    Z(too,1) = h;
end

patch(X,Y,Z,'green');

hold on 

[X1a,Y1a] = polybool('intersection',X1,Y1,X2,Y2);
[X1b,Y1b] = polybool('intersection',X3,Y3,X4,Y4);
%[Xc,Yc] = polybool('intersection',X5,Y5,X6,Y6);
%[Xd,Yd] = polybool('intersection',X7,Y7,X8,Y8);
[X1e,Y1e] = polybool('intersection',X1a,Y1a,X1b,Y1b);
%[Xf,Yf] = polybool('intersection',Xc,Yc,Xd,Yd);
%[Xg,Yg] =  polybool('intersection',Xe,Ye,Xf,Yf);
[X1h,Y1h] =  polybool('intersection',X9,Y9,X10,Y10);
%[Xi,Yi] =  polybool('intersection',X11,Y11,X12,Y12);
%[Xj,Yj] =  polybool('intersection',Xh,Yh,Xi,Yi);
[X1l,Y1l] =  polybool('intersection',X13,Y13,X14,Y14);
[X1k,Y1k] =  polybool('intersection',X1h,Y1h,X1l,Y1l);
%[Xm,Ym] =  polybool('intersection',X15,Y15,X16,Y16);
[X1n,Y1n] =  polybool('intersection',X1k,Y1k,X1e,Y1e);
%[Xp,Yp] =  polybool('intersection',Xn,Yn,Xk,Yk);

[Xq,Yq] =  polybool('intersection',X1n,Y1n,Xcen,Ycen);

num = numel(Xq);

for too = 1:1:num;
    Z(too,1) = h;
end

%patch(Xq,Yq,Z,'yellow');

hold on 

%[X1a,Y1a] = polybool('intersection',X1,Y1,X2,Y2);
%[X1b,Y1b] = polybool('intersection',X3,Y3,X4,Y4);
[X2c,Y2c] = polybool('intersection',X5,Y5,X6,Y6);
[X2d,Y2d] = polybool('intersection',X7,Y7,X8,Y8);
%[X1e,Y1e] = polybool('intersection',X1a,Y1a,X1b,Y1b);
[X2f,Y2f] = polybool('intersection',X2c,Y2c,X2d,Y2d);
%[Xg,Yg] =  polybool('intersection',Xe,Ye,X2f,Y2f);
%[X1h,Y1h] =  polybool('intersection',X9,Y9,X10,Y10);
[X2i,Y2i] =  polybool('intersection',X11,Y11,X12,Y12);
[X2j,Y2j] =  polybool('intersection',X2f,Y2f,X2i,Y2i);
%[X1l,Y1l] =  polybool('intersection',X13,Y13,X14,Y14);
%[X1k,Y1k] =  polybool('intersection',X1h,Y1h,X1l,Y1l);
[X2m,Y2m] =  polybool('intersection',X15,Y15,X16,Y16);
%[X1n,Y1n] =  polybool('intersection',X1k,Y1k,X1e,Y1e);
[X2p,Y2p] =  polybool('intersection',X2m,Y2m,X2j,Y2j);

%[X2q,Y2q] =  polybool('intersection',X2p,Y2p,Xcen,Ycen);

num1 = numel(X2p);

for too = 1:1:num1;
    Ztt(too,1) = h;
end

%patch(X2p,Y2p,Ztt,'yellow');
 


voxel(a + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);
voxel(d + [-wd/2,-ld/2,0],[wd ld hd],'c',0.7);


hold on 

global k vt va r U TIME Wi Wf
 
k = 5;
vt = 10;
va = 25;
r=  0.5;
U = [];
TIME = [];

Wi = [750,750];Wf = [750,1500];


x_t_0 = Wi(1,1);
y_t_0 = Wi(1,2);
chi_t_0 = 0;

x_a_0 = 400;
y_a_0 = 200;
chi_a_0 = pi/6;


tspan = [0,200];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('los_4',tspan,z0,options);


x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);


len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

axis([0 3000 0 3000]);
axis('square');
hold on


end