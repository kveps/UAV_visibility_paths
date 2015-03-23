clc;clear all;
n = 4;% input('Enter number of buildings in urban environment: ');
rotate3d;
R = [250,200,0];%input('Enter the point on the road: ');
for i = 1:1:n;
    
if(i == 1)
a = [1000,1125,0];%input('Enter centre of building: ');
b = [500,300,500];%input('Enter [l,w,h] of building: ');
end
if(i == 2)
a = [1000,375,0];%input('Enter centre of building: ');
b = [500,300,300];%input('Enter [l,w,h] of building: ');
end
if(i == 3)
a = [450,375,0];%input('Enter centre of building: ');
b = [500,400,200];%input('Enter [l,w,h] of building: ');
end
if(i == 4)
a = [450,1125,0];%input('Enter centre of building: ');
b = [500,400,300];%input('Enter [l,w,h] of building: ');
end


uav_h = 900;%input('Enter height at which UAV is flying: ');
uav_s = 1000;%1input('Enter maximum distance beyond which target cannot be observed: ');
radius = sqrt((uav_s)^2 - (uav_h)^2);center = R + [0,0,uav_h];
normal = [0,0,1];
theta=0:0.0001:2*pi;
v=null(normal);
points=repmat(center',1,size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));
%plot3(points(1,:),points(2,:),points(3,:),'-k');
%fill3(points(1,:), points(2,:), points(3,:), 'g');
hold on
axis([0 1500 0 1500 0 1500]);
axis('square');


l = b(1,1);w = b(1,2);h1 = b(1,3);
a1 = a + [w/2,l/2,h1];
a2 = a + [w/2,-l/2,h1];
a3 = a + [-w/2,-l/2,h1];
a4 = a + [-w/2,l/2,h1];

pee = 1;

for pee = 1:1:5;
    if(pee == 1)
        R = [750,1375,0];
    end
    if(pee == 2)
        R = [750,125,0];
    end,
    if(pee == 3)
        R = [1149,750,0];
    end
    if(pee == 4)
        R = [251,750,0];
    end
    if(pee == 5)
        R = [750,750,0];
    end
  
                   
syms x y z;
P = [x,y,z];
plane = z - uav_h;
syms t;
linea1 = R +t*(a1-R);linea2 = R +t*(a2-R);linea3 = R +t*(a3-R);linea4 = R +t*(a4-R);
funca1 = subs(plane, P, linea1);
funca2 = subs(plane, P, linea2);
funca3 = subs(plane, P, linea3);
funca4 = subs(plane, P, linea4);
ta1 = solve(funca1);ta2 = solve(funca2);ta3 = solve(funca3);ta4 = solve(funca4);
%plot3(250,250,0,'-o');
Pa1 = subs(linea1,t,ta1);Pa2 = subs(linea2,t,ta2);Pa3 = subs(linea3,t,ta3);Pa4 = subs(linea4,t,ta4);
m1 = (Pa1(1,2) - R(1,2))/(Pa1(1,1) - R(1,1));m2 = (Pa2(1,2) - R(1,2))/(Pa2(1,1) - R(1,1));
m3 = (Pa3(1,2) - R(1,2))/(Pa3(1,1) - R(1,1));m4 = (Pa4(1,2) - R(1,2))/(Pa4(1,1) - R(1,1));
%Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [100000,100000*m3,0];Pa8 = Pa4 + [100000,100000*m4,0];
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [100000,100000*m3,0];Pa8 = Pa4 + [100000,100000*m4,0];
    X = [Pa5(1,1) Pa6(1,1) Pa7(1,1) Pa3(1,1) Pa4(1,1) Pa8(1,1)];
    Y = [Pa5(1,2) Pa6(1,2) Pa7(1,2) Pa3(1,2) Pa4(1,2) Pa8(1,2)];
    Z = [Pa5(1,3) Pa6(1,3) Pa7(1,3) Pa3(1,3) Pa4(1,3) Pa8(1,3)];
    
    patch(X,Y,Z,'red');

end
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
    Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [100000,100000*m3,0];Pa8 = Pa4 + [100000,100000*m4,0];
    X = [Pa8(1,1) Pa5(1,1) Pa6(1,1) Pa2(1,1) Pa3(1,1) Pa4(1,1)];
    Y = [Pa8(1,2) Pa5(1,2) Pa6(1,2) Pa2(1,2) Pa3(1,2) Pa4(1,2)];
    Z = [Pa8(1,3) Pa5(1,3) Pa6(1,3) Pa2(1,3) Pa3(1,3) Pa4(1,3)];
    
    patch(X,Y,Z,'red');

end
if (R(1,1)<=a3(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [100000,100000*m3,0];Pa8 = Pa4 + [100000,100000*m4,0];
    X = [Pa5(1,1) Pa6(1,1) Pa7(1,1) Pa3(1,1) Pa4(1,1) Pa1(1,1)];
    Y = [Pa5(1,2) Pa6(1,2) Pa7(1,2) Pa3(1,2) Pa4(1,2) Pa1(1,2)];
    Z = [Pa5(1,3) Pa6(1,3) Pa7(1,3) Pa3(1,3) Pa4(1,3) Pa1(1,3)];
    
    patch(X,Y,Z,'red');
end
if (R(1,1)>a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa5 = Pa1 + [-100000,-100000*m1,0];Pa6 = Pa2 + [-100000,-100000*m2,0];Pa7 = Pa3 + [-100000,-100000*m3,0];Pa8 = Pa4 + [-100000,-100000*m4,0];
    X = [Pa1(1,1) Pa2(1,1) Pa6(1,1) Pa7(1,1) Pa8(1,1) Pa5(1,1)];
    Y = [Pa1(1,2) Pa2(1,2) Pa6(1,2) Pa7(1,2) Pa8(1,2) Pa5(1,2)];
    Z = [Pa1(1,3) Pa2(1,3) Pa6(1,3) Pa7(1,3) Pa8(1,3) Pa5(1,3)];
    
    patch(X,Y,Z,'red');
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
    Pa5 = Pa1 + [-100000,-100000*m1,0];Pa6 = Pa2 + [-100000,-100000*m2,0];Pa7 = Pa3 + [-100000,-100000*m3,0];Pa8 = Pa4 + [-100000,-100000*m4,0];
    X = [Pa1(1,1) Pa2(1,1) Pa3(1,1) Pa7(1,1) Pa8(1,1) Pa5(1,1)];
    Y = [Pa1(1,2) Pa2(1,2) Pa3(1,2) Pa7(1,2) Pa8(1,2) Pa5(1,2)];
    Z = [Pa1(1,3) Pa2(1,3) Pa3(1,3) Pa7(1,3) Pa8(1,3) Pa5(1,3)];
    
    patch(X,Y,Z,'red');
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa5 = Pa1 + [-100000,-100000*m1,0];Pa6 = Pa2 + [-100000,-100000*m2,0];Pa7 = Pa3 + [-100000,-100000*m3,0];Pa8 = Pa4 + [-100000,-100000*m4,0];
    X = [Pa1(1,1) Pa2(1,1) Pa6(1,1) Pa7(1,1) Pa8(1,1) Pa4(1,1)];
    Y = [Pa1(1,2) Pa2(1,2) Pa6(1,2) Pa7(1,2) Pa8(1,2) Pa4(1,2)];
    Z = [Pa1(1,3) Pa2(1,3) Pa6(1,3) Pa7(1,3) Pa8(1,3) Pa4(1,3)];
    
    patch(X,Y,Z,'red');
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
    Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [-100000,-100000*m3,0];Pa8 = Pa4 + [-100000,-100000*m4,0];
    X = [Pa6(1,1) Pa2(1,1) Pa3(1,1) Pa7(1,1) Pa8(1,1) Pa5(1,1)];
    Y = [Pa6(1,2) Pa2(1,2) Pa3(1,2) Pa7(1,2) Pa8(1,2) Pa5(1,2)];
    Z = [Pa6(1,3) Pa2(1,3) Pa3(1,3) Pa7(1,3) Pa8(1,3) Pa5(1,3)];
    
    patch(X,Y,Z,'red');
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa5 = Pa1 + [100000,100000*m1,0];Pa6 = Pa2 + [100000,100000*m2,0];Pa7 = Pa3 + [-100000,-100000*m3,0];Pa8 = Pa4 + [-100000,-100000*m4,0];
    X = [Pa1(1,1) Pa5(1,1) Pa6(1,1) Pa7(1,1) Pa8(1,1) Pa4(1,1)];
    Y = [Pa1(1,2) Pa5(1,2) Pa6(1,2) Pa7(1,2) Pa8(1,2) Pa4(1,2)];
    Z = [Pa1(1,3) Pa5(1,3) Pa6(1,3) Pa7(1,3) Pa8(1,3) Pa4(1,3)];
    
    patch(X,Y,Z,'red');
end


voxel(a + [-w/2,-l/2,0],[w l h1],'c',0.7);

hold on

end

hold on 

end




