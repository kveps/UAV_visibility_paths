clc;clear all;
R = [250,250,0];%input('Enter the point on the road: ');
uav_h1 = 700;
uav_h2 = 1000;
uav_s = 1500;
radius = sqrt((uav_s)^2 - (uav_h)^2);center = R + [0,0,uav_h];
normal = [0,0,1];
theta=0:0.0001:2*pi;
v=null(normal);
points=repmat(center',1,size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));
%plot3(points(1,:),points(2,:),points(3,:),'-k');
%fill3(points(1,:), points(2,:), points(3,:), 'g');
hold on
axis([-1500 1500 -1500 1500 0 1500]);
axis('square');


%n = 1;%input('Enter number of buildings in urban environment: ');
rotate3d;
%for i = 1:1:n;
a = [380,375,0];%input('Enter centre of building: ');
b = [220,180,100];%input('Enter [l,w,h] of building: ');
l = b(1,1);w = b(1,2);h1 = b(1,3);
a1 = a + [w/2,l/2,h1];
a2 = a + [w/2,-l/2,h1];
a3 = a + [-w/2,-l/2,h1];
a4 = a + [-w/2,l/2,h1];
syms x y z;
P = [x,y,z];
plane = z - uav_h1;
syms t;
linea1 = R +t*(a1-R);linea2 = R +t*(a2-R);linea3 = R +t*(a3-R);linea4 = R +t*(a4-R);
funca1 = subs(plane, P, linea1);
funca2 = subs(plane, P, linea2);
funca3 = subs(plane, P, linea3);
funca4 = subs(plane, P, linea4);
ta1 = solve(funca1);ta2 = solve(funca2);ta3 = solve(funca3);ta4 = solve(funca4);
plot3(0,0,0);
Pa1 = subs(linea1,t,ta1);Pa2 = subs(linea2,t,ta2);Pa3 = subs(linea3,t,ta3);Pa4 = subs(linea4,t,ta4);
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2) && R(1,1))
    Pa1 = Pa1 + [100000,100000,0];Pa2 = Pa2 + [100000,-100000,0];Pa3 = Pa3 + [0,-100000,0];Pa4 = Pa4 + [0,100000,0];
end
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Pa1 = Pa1 + [100000,100000,0];Pa2 = Pa2 + [100000,0,0];Pa4 = Pa4 + [0,100000,0];
end
if (R(1,1)<=a3(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Pa1 = Pa1 + [100000,0,0];Pa2 = Pa2 + [100000,-100000,0];Pa3 = Pa3 + [0,-100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2))
    Pa1 = Pa1 + [0,100000,0];Pa2 = Pa2 + [0,-100000,0];Pa3 = Pa3 + [-100000,-100000,0];Pa4 = Pa4 + [-100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Pa1 = Pa1 + [0,100000,0];Pa3 = Pa3 + [-100000,0,0];Pa4 = Pa4 + [100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Pa2 = Pa2 + [0,-100000,0];Pa3 = Pa3 + [-10000,-100000,0];Pa4 = Pa4 + [-100000,0,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Pa1 = Pa1 + [100000,100000,0];Pa2 = Pa2 + [100000,0,0];Pa3 = Pa3 + [-100000,0,0];Pa4 = Pa4 + [-100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Pa1 = Pa1 + [100000,0,0];Pa2 = Pa2 + [100000,-100000,0];Pa3 = Pa3 + [-100000,-100000,0];Pa4 = Pa4 + [-100000,0,0];
end
m = double(Pa3(1,1));n = double(Pa2(1,1));o = double(Pa3(1,2));z = double(Pa4(1,2));

a = [380,375,0];%input('Enter centre of building: ');
b = [220,180,100];%input('Enter [l,w,h] of building: ');
l = b(1,1);w = b(1,2);h1 = b(1,3);
a1 = a + [w/2,l/2,h1];
a2 = a + [w/2,-l/2,h1];
a3 = a + [-w/2,-l/2,h1];
a4 = a + [-w/2,l/2,h1];
syms x y z;
P = [x,y,z];
plane = z - uav_h1;
syms t;
linea1 = R +t*(a1-R);linea2 = R +t*(a2-R);linea3 = R +t*(a3-R);linea4 = R +t*(a4-R);
funca1 = subs(plane, P, linea1);
funca2 = subs(plane, P, linea2);
funca3 = subs(plane, P, linea3);
funca4 = subs(plane, P, linea4);
ta1 = solve(funca1);ta2 = solve(funca2);ta3 = solve(funca3);ta4 = solve(funca4);
plot3(0,0,0);
Qa1 = subs(linea1,t,ta1);Qa2 = subs(linea2,t,ta2);Qa3 = subs(linea3,t,ta3);Qa4 = subs(linea4,t,ta4);
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2) && R(1,1))
    Qa1 = Qa1 + [100000,100000,0];Qa2 = Qa2 + [100000,-100000,0];Qa3 = Qa3 + [0,-100000,0];Qa4 = Qa4 + [0,100000,0];
end
if (R(1,1)<=a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Qa1 = Qa1 + [100000,100000,0];Qa2 = Qa2 + [100000,0,0];Qa4 = Qa4 + [0,100000,0];
end
if (R(1,1)<=a3(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Qa1 = Qa1 + [100000,0,0];Qa2 = Qa2 + [100000,-100000,0];Qa3 = Qa3 + [0,-100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) >= a3(1,2))
    Qa1 = Qa1 + [0,100000,0];Qa2 = Qa2 + [0,-100000,0];Qa3 = Qa3 + [-100000,-100000,0];Qa4 = Qa4 + [-100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Qa1 = Qa1 + [0,100000,0];Qa3 = Qa3 + [-100000,0,0];Qa4 = Qa4 + [100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)>a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Qa2 = Qa2 + [0,-100000,0];Qa3 = Qa3 + [-10000,-100000,0];Qa4 = Qa4 + [-100000,0,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)<=a4(1,2)) && (R(1,2) <= a3(1,2))
   Qa1 = Qa1 + [100000,100000,0];Qa2 = Qa2 + [100000,0,0];Qa3 = Qa3 + [-100000,0,0];Qa4 = Qa4 + [-100000,100000,0];
end
if (R(1,1)>a3(1,1)) && (R(1,1)<a2(1,1)) && (R(1,2)>=a4(1,2)) && (R(1,2) >= a3(1,2))
   Qa1 = Qa1 + [100000,0,0];Qa2 = Qa2 + [100000,-100000,0];Qa3 = Qa3 + [-100000,-100000,0];Qa4 = Qa4 + [-100000,0,0];
end

X = [Pa1(1,1) Pa2(1,1) Pa3(1,1) Pa4(1,1) Qa1(1,1) Qa2(1,1) Qa3(1,1) Qa4(1,1)];
Y = [Pa1(1,2) Pa2(1,2) Pa3(1,2) Pa4(1,2) Qa1(1,2) Qa2(1,2) Qa3(1,2) Qa4(1,2)];
Z = [Pa1(1,3) Pa2(1,3) Pa3(1,3) Pa4(1,3) Qa1(1,3) Qa2(1,3) Qa3(1,3) Qa4(1,3)];

patch(X,Y,Z,'red');


%points(1,f+1) = 530;points(2,f+1) = 355;
%fill3(points(1,:), points(2,:), points(3,:), 'g');


voxel(a + [-w/2,-l/2,0],[w l h1],'c',0.7);

hold on




