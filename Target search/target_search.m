clc;clear all;
close all;

rotate3d;

icc = 0; bat =0;
target_pos_0 = [900,2250,0];
sensor_range = 1000;

plot3(target_pos_0(1,1),target_pos_0(1,2),target_pos_0(1,3),'o','MarkerSize',7,'MarkerFaceColor','b');

for t = 1:1:9
      
h = 500;%input('Enter the height of UAV: ');
const1 = 0;const2 = 1500;

ad = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
bd = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');
cd = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
dd = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');

random = randi([150 350],1,1000);

switch(t)
    case 1
        i = 0;
        j = 0;
        ad(1,3)= 280;bd(1,3) = 270;cd(1,3)= 300;dd(1,3) = 315;

    case 2
        i = 750;
        j = 0;
        ad(1,3)= 350;bd(1,3) = 320;cd(1,3)= 270;dd(1,3) = 280;
        
    case 3
        i = 1500;
        j = 0;
        ad(1,3)= 296;bd(1,3) = 277;cd(1,3)= 320;dd(1,3) = 350;
        
    case 4
        i = 0;
        j = 750;
        ad(1,3)= 270;bd(1,3) = 280;cd(1,3)= 315;dd(1,3) = 270;
        
    case 5
        i = 750;
        j = 750;
        ad(1,3)= 260;bd(1,3) = 350;cd(1,3)= 280;dd(1,3) = 270;
        
    case 6
        i = 1500;
        j = 750;
        ad(1,3)= 260;bd(1,3) = 296;cd(1,3)= 350;dd(1,3) = 260;
        
    case 7
        i = 0;
        j = 1500;
        ad(1,3)= 280;bd(1,3) = 270;cd(1,3)= 270;dd(1,3) = 315;
        
    case 8
        i = 750;
        j = 1500;
        ad(1,3)= 310;bd(1,3) = 260;cd(1,3)= 270;dd(1,3) = 280;
        
    case 9
        i = 1500;
        j = 1500;
        ad(1,3)= 250;bd(1,3) = 260;cd(1,3)= 260;dd(1,3) = 310;
        
end

wr = 250;%input('Enter width of the road: ');
wrs = 250;

a(t,:) = [1125+i,1125+j,0];%input('Enter centre of building: ');
b(t,:) = [1125+i,375+j,0];
c(t,:) = [375+i,375+j,0];
d(t,:) = [375+i,1125+j,0];


la = ad(1,1);wa = ad(1,2);ha = ad(1,3);
lb = bd(1,1);wb = bd(1,2);hb = bd(1,3);
lc = cd(1,1);wc = cd(1,2);hc = cd(1,3);
ld = dd(1,1);wd = dd(1,2);hd = dd(1,3);



R = [750,0,0];%input('Enter the point on the road: ');

R(1,2) = 1125 + (la/2) - 0.0001 ;

%if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha) ;P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(1125 -(la/2) - R(1,2))) ;P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd) ;P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd) ;P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X1 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y1 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z1 = [h h h h h h h h ];

%end

R(1,2) = 1125 - (la/2) + 0.0001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(1125 -(la/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd);P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd);P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X2 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y2 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z2 = [h h h h h h h h];

end


R(1,2) = 375 + (lb/2) - 0.0001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const2;

X3 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y3 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z3 = [h h h h h h h h];

end

R(1,2) = 375 - (lb/2) + 0.0001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const2;

X4 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y4 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z4 = [h h h h h h h h];

end

R(1,2) = 1125 - (la/2) + 0.0001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125 + (wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125 + (wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) =R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*(h/hb);P4(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P5(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 - (lb/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P6(1,2) = const1;

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*(h/hc);P8(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P9(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P9(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P10(1,1) = const1;P10(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 - (wc/2) - R(1,1)));


X9 = [1500+ i P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i P9(1,1)+ i P10(1,1)+ i 0+i];
Y9 = [1500+ j P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j P9(1,2)+ j P10(1,2)+ j 1500+ j];
Z9 = [h h h h h h h h h h h h];

end

R(1,2) = 375 + (lb/2) - 0.0001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (wrs/2)*(h/ha);

P4(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P4(1,2) = R(1,2) + (wrs/2)*(h/ha);

P5(1,1) = const2; P5(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 + (wa/2) - R(1,1)));

P6(1,1) = const1; P6(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P7(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*(h/hd);P8(1,2) = R(1,2) + (wrs/2)*(h/hd);

P9(1,1) = R(1,1) + (-wr/2)*(h/hd);P9(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P10(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P10(1,2) = const2;

X10 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i 1500+ i 0+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i P9(1,1)+ i P10(1,1)+ i];
Y10 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j 0+ j 0+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j P9(1,2)+ j P10(1,2)+ j];
Z10 = [h h h h h h h h h h h h];

end

R(1,2) = 1125 + (la/2) - 0.0001;

if (R(1,2)<=1125+(la/2)) && (R(1,2)>=1125-(la/2)) && (R(1,2)<=1125+(ld/2)) && (R(1,2)>=1125-(ld/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375+(lb/2) - R(1,2)));P1(1,2) = const1;

P2(1,1) = R(1,1) + (wr/2)*(h/hb);P2(1,2) = R(1,2) + (375+(lb/2)- R(1,2))*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P4(1,2) = const1;

P5(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (-wr/2)*(h/hc);P6(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P7(1,1) = R(1,1) + (-wr/2)*(h/hc);P7(1,2) = R(1,2) + (375 +(lc/2) - R(1,2))*(h/hc);

P8(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 +(lc/2) - R(1,2)));P8(1,2) = const1;

X13 = [1500+ i 1500+ i P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i 0+ i 0+ i];
Y13 = [1500+ j 0+ j P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j 0+ j 1500+ j];
Z13 = [h h h h h h h h h h h h];

end

R(1,2) = 375 - (lb/2) + 0.0001;

if (R(1,2)<=375+(lb/2)) && (R(1,2)>=375-(lb/2)) && (R(1,2)<=375+(lc/2)) && (R(1,2)>=375-(lc/2)) 

P1(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P1(1,2) = const2;

P2(1,1) = R(1,1) + (wr/2)*(h/ha);P2(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P3(1,1) = R(1,1) + (wr/2)*(h/ha);P3(1,2) = R(1,2) + (1125 - (la/2) - R(1,2))*(h/ha);

P4(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125 -(la/2) - R(1,2)));P4(1,2) = const2;

P5(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 -(ld/2) - R(1,2)));P5(1,2) = const2;

P6(1,1) = R(1,1) + (-wr/2)*(h/hd);P6(1,2) = R(1,2) + (1125 -(ld/2) - R(1,2))*(h/hd);

P7(1,1) = R(1,1) + (-wr/2)*(h/hd);P7(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P8(1,2) = const2;

X14 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i 1500+ i 1500+ i 0+ i 0+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y14 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j 1500+ j 0+ j 0+ j 1500+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z14 = [h h h h h h h h h h h h];

end





R(1,2) = 750; 

R(1,1) = 1125 + (wb/2) - 0.0001;

if (R(1,1)<1125+(wa/2)) && (R(1,1)>=1125-(wa/2)) && (R(1,1)<=1125+(wb/2)) && (R(1,1)>=1125-(wb/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1125 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(1125 -(wb/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(1125 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1125 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 +(wa/2) - R(1,1)));

X5 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y5 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z5 = [h h h h h h h h];

end

R(1,1) = 1125 - (wb/2) + 0.0001;

if (R(1,1)<1125+(wa/2)) && (R(1,1)>=1125-(wa/2)) && (R(1,1)<=1125+(wb/2)) && (R(1,1)>=1125-(wb/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1125 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(1125 -(wb/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(1125 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1125 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 +(wa/2) - R(1,1)));

X6 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y6 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z6 = [h h h h h h h h];

end


R(1,1) = 375 + (wc/2) - 0.0001;

if (R(1,1)<=375+(wc/2)) && (R(1,1)>=375-(wc/2)) && (R(1,1)<=375+(wd/2)) && (R(1,1)>=375-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(375+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (375+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P6(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (375 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(375 +(wd/2) - R(1,1)));

X7 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y7 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z7 = [h h h h h h h h];

end


R(1,1) = 375 - (wc/2) + 0.0001;

if (R(1,1)<=375+(wc/2)) && (R(1,1)>=375-(wc/2)) && (R(1,1)<=375+(wd/2)) && (R(1,1)>=375-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(375+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (375+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P3(1,2) =  R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P6(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (375 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(375 +(wd/2) - R(1,1)));

X8 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y8 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
Z8 = [h h h h h h h h];

end

R(1,1) = 1125 - (wb/2) + 0.0001;

if (R(1,1)<1125+(wa/2)) && (R(1,1)>=1125-(wa/2)) && (R(1,1)<=1125+(wb/2)) && (R(1,1)>=1125-(wb/2)) 

P1(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P1(1,2) = const1;

P2(1,1) = R(1,1) + (-wr/2)*(h/hc);P2(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P3(1,1) = R(1,1) + (-wr/2)*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = R(1,1) + (375 -(wc/2) - R(1,1))*(h/hc);P4(1,2) = R(1,2) + (-wrs/2)*(h/hd);

P5(1,1) = const1;P5(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wa/2) - R(1,1)));

P6(1,1) = const1;P6(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P7(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = R(1,1) + (-wr/2)*(h/hd); P8(1,2) = R(1,2) + (wrs/2)*(h/hd);

P9(1,1) = R(1,1) + (-wr/2)*(h/hd);P9(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P10(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P10(1,2) = const2;

X11 = [1500+ i P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i P9(1,1)+ i P10(1,1)+ i 1500+ i];
Y11 = [0+ j P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j P9(1,2)+ j P10(1,2)+ j 1500+ j];
Z11 = [h h h h h h h h h h h h];

end

R(1,1) = 375 + (wc/2) - 0.0001;

if (R(1,1)<=375+(wc/2)) && (R(1,1)>=375-(wc/2)) && (R(1,1)<=375+(wd/2)) && (R(1,1)>=375-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125 + (wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125 + (wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (wr/2)*(h/hb);P3(1,2) =  R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = R(1,1) + (wr/2)*(h/hb);P4(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P5(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P5(1,2) = const1;

P6(1,1) = R(1,1) + (wr/2)*((const2 - R(1,2))/(1125+(la/2) - R(1,2)));P6(1,2) = const2;

P7(1,1) = R(1,1) + (wr/2)*(h/ha);P7(1,2) = R(1,2) + (1125+(la/2)- R(1,2))*(h/ha);

P8(1,1) = R(1,1) + (wr/2)*(h/ha); P8(1,2) = R(1,2) + (wrs/2)*(h/ha);

P9(1,1) = R(1,1) + (1125 + (wa/2) - R(1,1))*(h/ha);P9(1,2) = R(1,2) + (wrs/2)*(h/ha);

P10(1,1) = const2; P10(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 + (wa/2) - R(1,1)));

X12 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i 0+ i 0+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i P9(1,1)+ i P10(1,1)+ i];
Y12 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j 0+ j 1500+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j P9(1,2)+ j P10(1,2)+ j];
Z12 = [h h h h h h h h h h h h];

end

R(1,1) = 1125 + (wb/2) - 0.0001;

if (R(1,1)<=1125 + (wb/2)) && (R(1,1)>=1125-(wb/2)) && (R(1,1)<=1125+(wa/2)) && (R(1,1)>=1125-(wa/2)) 

P1(1,1) = const1; P1(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375+(wc/2)- R(1,1)));

P2(1,1) = R(1,1) + (375+(wc/2)- R(1,1))*(h/hc);P2(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P3(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P3(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P4(1,1) = const1;P4(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P5(1,1) = const1;P5(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P6(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P6(1,2) = R(1,2) + (wrs/2)*(h/hd);

P7(1,1) = R(1,1) + (375 +(wd/2) - R(1,1))*(h/hd);P7(1,2) = R(1,2) + (wrs/2)*(h/hd);

P8(1,1) = const1; P8(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 +(wd/2) - R(1,1)));

X15 = [1500+ i 0+ i P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i 0+ i 1500+ i];
Y15 = [0+ j 0+ j P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j 1500+ j 1500+ j];
Z15 = [h h h h h h h h h h h h];

end

R(1,1) = 375 - (wc/2) + 0.0001;

if (R(1,1)<375+(wc/2)) && (R(1,1)>=375-(wc/2)) && (R(1,1)<=375+(wd/2)) && (R(1,1)>=375-(wd/2)) 

P1(1,1) = const2; P1(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125+(wb/2)- R(1,1)));

P2(1,1) = R(1,1) + (1125+(wb/2)- R(1,1))*(h/hb);P2(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P3(1,1) = R(1,1) + (1125 - (wb/2) - R(1,1))*(h/hb);P3(1,2) = R(1,2) + (-wrs/2)*(h/hb);

P4(1,1) = const2;P4(1,2) = R(1,2) + (-wrs/2)*((const2 - R(1,1))/(1125 -(wb/2) - R(1,1)));

P5(1,1) = const2;P5(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 -(wa/2) - R(1,1)));

P6(1,1) = R(1,1) + (1125 -(wa/2) - R(1,1))*(h/ha);P6(1,2) = R(1,2) + (wrs/2)*(h/ha);

P7(1,1) = R(1,1) + (1125 +(wa/2) - R(1,1))*(h/ha);P7(1,2) = R(1,2) + (wrs/2)*(h/ha);

P8(1,1) = const2; P8(1,2) = R(1,2) + (wrs/2)*((const2 - R(1,1))/(1125 +(wa/2) - R(1,1)));

X16 = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i 1500+ i 0+ i 0+ i 1500+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i];
Y16 = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j 0+ j 0+ j 1500+ j 1500+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j];
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

P9(1,1) = R(1,1) + (wr/2)*(h/hb);P9(1,2) = R(1,2) + (375 - (lb/2) - R(1,2))*(h/hb);

P10(1,1) = R(1,1) + (wr/2)*((const1 - R(1,2))/(375 -(lb/2) - R(1,2)));P10(1,2) = const1;

P11(1,1) = R(1,1) + (-wr/2)*((const1 - R(1,2))/(375 -(lc/2) - R(1,2)));P11(1,2) = const1;

P12(1,1) = R(1,1) + (-wr/2)*(h/hc);P12(1,2) = R(1,2) + (375 -(lc/2) - R(1,2))*(h/hc);

P13(1,1) = R(1,1) + (-wr/2)*(h/hc);P13(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P14(1,1) = R(1,1) + (375 - (wc/2) - R(1,1))*(h/hc);P14(1,2) = R(1,2) + (-wrs/2)*(h/hc);

P15(1,1) = const1;P15(1,2) = R(1,2) + (-wrs/2)*((const1 - R(1,1))/(375 -(wc/2) - R(1,1)));

P16(1,1) = const1;P16(1,2) = R(1,2) + (wrs/2)*((const1 - R(1,1))/(375 -(wd/2) - R(1,1)));

P17(1,1) = R(1,1) + (375 -(wd/2) - R(1,1))*(h/hd);P17(1,2) = R(1,2) + (wrs/2)*(h/hd);

P18(1,1) = R(1,1) + (-wr/2)*(h/hd);P18(1,2) = R(1,2) + (wrs/2)*(h/hd); 

P19(1,1) = R(1,1) + (-wr/2)*(h/hd);P19(1,2) = R(1,2) + (1125 +(ld/2) - R(1,2))*(h/hd);

P20(1,1) = R(1,1) + (-wr/2)*((const2 - R(1,2))/(1125 +(ld/2) - R(1,2)));P20(1,2) = const2;

Xcen = [P1(1,1)+ i P2(1,1)+ i P3(1,1)+ i P4(1,1)+ i P5(1,1)+ i P6(1,1)+ i P7(1,1)+ i P8(1,1)+ i P9(1,1)+ i P10(1,1)+ i P11(1,1)+ i P12(1,1)+ i P13(1,1)+ i P14(1,1)+ i P15(1,1)+ i P16(1,1)+ i P17(1,1)+ i P18(1,1)+ i P19(1,1)+ i P20(1,1)+ i ];
Ycen = [P1(1,2)+ j P2(1,2)+ j P3(1,2)+ j P4(1,2)+ j P5(1,2)+ j P6(1,2)+ j P7(1,2)+ j P8(1,2)+ j P9(1,2)+ j P10(1,2)+ j P11(1,2)+ j P12(1,2)+ j P13(1,2)+ j P14(1,2)+ j P15(1,2)+ j P16(1,2)+ j P17(1,2)+ j P18(1,2)+ j P19(1,2)+ j P20(1,2)+ j ];
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

Z = zeros(num);
too = 1;
centr = randn(num,3);

for too = 1:1:num
    Z(too,1) = h;
    centr(t,1) = centr(t,1) + X(1,too);
    centr(t,2) = centr(t,2) + Y(1,too);
    centr(t,3) = centr(t,3) + h;
end

%patch(X,Y,Z,'green');
hold on

[X1a,Y1a] = polybool('intersection',X1,Y1,X2,Y2);
[X1b,Y1b] = polybool('intersection',X3,Y3,X4,Y4);
[X1e,Y1e] = polybool('intersection',X1a,Y1a,X1b,Y1b);
[X1h,Y1h] =  polybool('intersection',X9,Y9,X10,Y10);
[X1l,Y1l] =  polybool('intersection',X13,Y13,X14,Y14);
[X1k,Y1k] =  polybool('intersection',X1h,Y1h,X1l,Y1l);
[X1n,Y1n] =  polybool('intersection',X1k,Y1k,X1e,Y1e);

[Xq,Yq] =  polybool('intersection',X1n,Y1n,Xcen,Ycen);

Zq = zeros(numel(Xq));
for too = 1:1:numel(Xq);
    Zq(too,1) = h;
end

%patch(Xq,Yq,Zq,'yellow');
hold on

[X2c,Y2c] = polybool('intersection',X5,Y5,X6,Y6);
[X2d,Y2d] = polybool('intersection',X7,Y7,X8,Y8);
[X2f,Y2f] = polybool('intersection',X2c,Y2c,X2d,Y2d);
[X2i,Y2i] =  polybool('intersection',X11,Y11,X12,Y12);
[X2j,Y2j] =  polybool('intersection',X2f,Y2f,X2i,Y2i);
[X2m,Y2m] =  polybool('intersection',X15,Y15,X16,Y16);

[X2p,Y2p] =  polybool('intersection',X2m,Y2m,X2j,Y2j);

Z2p = zeros(numel(X2p));
for tom = 1:1:numel(X2p);
    Z2p(tom,1) = h;
end

%patch(X2p,Y2p,Z2p,'yellow');
hold on


visibility{t} = [X;Y;];
visibility1{t} = [Xq;Yq;];
visibility2{t} = [X2p;Y2p;];



cent(t,1) = centr(t,1)/num;
cent(t,2) = centr(t,2)/num;
cent(t,3) = centr(t,3)/num;

%plot3(cent(t,1) ,cent(t,2) ,cent(t,3),'o','MarkerSize',7,'MarkerFaceColor','k');
%hold on 

 
voxel(a(t,:) + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b(t,:) + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c(t,:) + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);
voxel(d(t,:) + [-wd/2,-ld/2,0],[wd ld hd],'c',0.7);
 

axis([0 3000 0 3000]);
axis('square');

hold on 


x_a_0 = 0;
y_a_0 = 0;
chi_a_0 = pi/6;

end

fifa = 1;

while fifa < 100

if(mod(fifa,2) ~= 0)

for u = 1:1:9

if ( u == 4)
    ud = 6;
end
if ( u == 6)
    ud = 4;
end
if ( u~=4 && u~= 6)
 ud = u;
end

global k vt va r TIME 
 
k = 5;
vt = 18;
va = 25;
r=  0.5;
TIME = [];

x_t_0 = cent(ud,1);
y_t_0 = cent(ud,2);
chi_t_0 = pi/2;

t = ( ( (x_t_0 - x_a_0)^2 + (y_t_0 - y_a_0)^2)^0.5) / va;

tspan = [0,t];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;target_pos_0(1,1);target_pos_0(1,2)];
options = odeset ('reltol',1e-10,'abstol',1e-10);

[t,z] = ode45('target_los',tspan,z0,options);

x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);

target_pos_x = z(:,7);target_pos_y = z(:,8);

len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

visibility_temp1 = visibility1{ud};
Xw1 = visibility_temp1(1,:); Yw1 = visibility_temp1(2,:);
Zw1 = zeros(numel(Xw1));
for oi = 1:1:numel(Xw1)
      Zw1(oi,1) = h;
end

visibility_temp2 = visibility2{ud};
Xw2 = visibility_temp2(1,:); Yw2 = visibility_temp2(2,:);
Zw2 = zeros(numel(Xw2));
for oi = 1:1:numel(Xw2)
      Zw2(oi,1) = h;
end

hd1 = patch(Xw1, Yw1, Zw1,'yellow','HandleVisibility','off');
hold on 
hd2 = patch(Xw2, Yw2, Zw2,'yellow','HandleVisibility','off');
i = 1;
gta = 0;

set(gcf,'Renderer','zbuffer'); 
while i<=length(x_t)
    plot3(target_pos_x(i),target_pos_y(i),0,'b');
    hold on
    plot3(x_a(i),y_a(i),h_uav(i),'r');
    hold on
    check = search(x_a(i),y_a(i), target_pos_x(i), target_pos_y(i),visibility{ud},visibility1{ud},visibility2{ud},a(ud,:),b(ud,:),c(ud,:),d(ud,:),h,sensor_range);
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
for u = 6:-1:3

if ( u == 3)
    ud = 1;
else
 ud = u;
end

x_t_0 = cent(ud,1);
y_t_0 = cent(ud,2);
chi_t_0 = pi/2;

t = ( ( (x_t_0 - x_a_0)^2 + (y_t_0 - y_a_0)^2)^0.5) / va;

tspan = [0,t];
z0 = [x_t_0;y_t_0;chi_t_0;x_a_0;y_a_0;chi_a_0;target_pos_0(1,1);target_pos_0(1,2);u];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('target_los',tspan,z0,options);

x_t = z(:,1);y_t = z(:,2);

x_a = z(:,4);y_a = z(:,5);

chi_t = z(:,3);chi_a = z(:,6);

target_pos_x = z(:,7);target_pos_y = z(:,8);

len1 = length(x_t);
for check = 1:1:len1
    h_t(check,1) = 0;
    h_uav(check,1) = h;
end

visibility_temp1 = visibility1{ud};
Xw1 = visibility_temp1(1,:); Yw1 = visibility_temp1(2,:);
Zw1 = zeros(numel(Xw1));
for oi = 1:1:numel(Xw1)
      Zw1(oi,1) = h;
end

visibility_temp2 = visibility2{ud};
Xw2 = visibility_temp2(1,:); Yw2 = visibility_temp2(2,:);
Zw2 = zeros(numel(Xw2));
for oi = 1:1:numel(Xw2)
      Zw2(oi,1) = h;
end

hd1 = patch(Xw1, Yw1, Zw1,'yellow','HandleVisibility','off');
hold on 
hd2 = patch(Xw2, Yw2, Zw2,'yellow','HandleVisibility','off');

i = 1;
gta = 0;

set(gcf,'Renderer','zbuffer'); 
while i<=length(x_t)
    plot3(target_pos_x(i),target_pos_y(i),0,'b');
    hold on
    plot3(x_a(i),y_a(i),h_uav(i),'r');
    hold on
    check = search(x_a(i),y_a(i), target_pos_x(i), target_pos_y(i),visibility{ud},visibility1{ud},visibility2{ud},a(ud,:),b(ud,:),c(ud,:),d(ud,:),h,sensor_range);
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

if (bat == 1)
    break;
end

fifa  = fifa + 1;
hold on

end


x_a_0 = x_a(i-1);
y_a_0 = y_a(i-1);
chi_a_0 = chi_a(i-1);

target_pos_0(1,1) = target_pos_x(i-1);
target_pos_0(1,2) = target_pos_y(i-1);
%chi_t_0 = chi_t(i-1);

chi_t_0 = 3*pi/2;

tspan1 = [0,50];
z0_g = [target_pos_0(1,1);target_pos_0(1,2);chi_t_0;x_a_0;y_a_0;chi_a_0;];
options = odeset ('reltol',1e-10,'abstol',1e-10);
[t,z] = ode45('los_4',tspan1,z0_g,options);

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
