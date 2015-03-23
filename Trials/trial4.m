clear all;clc;
R = [250,250,0];%input('Enter the point on the road: ');
uav_h = 700;
uav_s = 1000;
radius = sqrt((uav_s)^2 - (uav_h)^2);center = R + [0,0,uav_h];
normal = [0,0,1];
theta=0:0.0001:2*pi;
v=null(normal);
points=repmat(center',1,size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));
Pa1 = [10000,0,0];Pa2 = [0,10000,0];Pa3 =  [0,0,10000];Pa4 = [10000,10000,10000];
[p,q] = size(points);
for s=1:1:q;
    %t = points(1,s);
    if (points(1,s) <= Pa1(1,1)) && (points(1,s) <= Pa2(1,2)) && (points(2,s) <= Pa3(1,3)) && (points(2,s) <= Pa4(1,2))
        points(1,s) = 0;points(2,s) = 0;
        %fill3(points(1,:), points(2,:), points(3,:), 'g');
    end
end