function [X,Y] = approx_visiblity(h1,c1,h2,c2,h,R1, R2,melon)

if melon == 1
l = 500;w =500;

c_1 = c1 + [w/2,l/2,h1];   c_1g = c_1 - [0,0,h1];
c_2 = c1 + [w/2,-l/2,h1];  c_2g = c_2 - [0,0,h1];
c_3 = c1 + [-w/2,-l/2,h1]; c_3g = c_3 - [0,0,h1];
c_4 = c1 + [-w/2,l/2,h1];  c_4g = c_4 - [0,0,h1];

P1 = [0,0,h];
P2 = [10,9,h];
P3 = [25,27,h];

normal = cross(P1-P2,P2-P3);

[p1,ch1] = plane_line_intersect(normal,[0,0,h],R1,c_1);
[p2,ch2] = plane_line_intersect(normal,[0,0,h],R1,c_2);

p1_dash = [p1(1,1) , 3000, h];
p2_dash = [p2(1,1) , 0, h];

X1 = [p1_dash(1,1) p2_dash(1,1) 3000 3000];
Y1 = [p1_dash(1,2) p2_dash(1,2) 0 3000];

[p3,ch3] = plane_line_intersect(normal,[0,0,h],R2,c_1);
[p4,ch4] = plane_line_intersect(normal,[0,0,h],R2,c_2);

p3_dash = [p3(1,1) , 3000, h];
p4_dash = [p4(1,1) , 0, h];

X2 = [p3_dash(1,1) p4_dash(1,1) 3000 3000];
Y2 = [p3_dash(1,2) p4_dash(1,2) 0 3000];

[X3, Y3] = polybool('intersection',X1, Y1, X2, Y2);

c_1 = c2 + [w/2,l/2,h2];   c_1g = c_1 - [0,0,h2];
c_2 = c2 + [w/2,-l/2,h2];  c_2g = c_2 - [0,0,h2];
c_3 = c2 + [-w/2,-l/2,h2]; c_3g = c_3 - [0,0,h2];
c_4 = c2 + [-w/2,l/2,h2];  c_4g = c_4 - [0,0,h2];

P1 = [0,0,h];
P2 = [10,9,h];
P3 = [25,27,h];

normal = cross(P1-P2,P2-P3);

[p1,ch1] = plane_line_intersect(normal,[0,0,h],R1,c_3);
[p2,ch2] = plane_line_intersect(normal,[0,0,h],R1,c_4);

p1_dash = [p1(1,1) , 0, h];
p2_dash = [p2(1,1) , 3000, h];

X1 = [p1_dash(1,1) p2_dash(1,1) 0 0];
Y1 = [p1_dash(1,2) p2_dash(1,2) 3000 0];

[p3,ch3] = plane_line_intersect(normal,[0,0,h],R2,c_3);
[p4,ch4] = plane_line_intersect(normal,[0,0,h],R2,c_4);

p3_dash = [p3(1,1) , 0, h];
p4_dash = [p4(1,1) , 3000, h];

X2 = [p3_dash(1,1) p4_dash(1,1) 0 0];
Y2 = [p3_dash(1,2) p4_dash(1,2) 3000 0];

[X6, Y6] = polybool('intersection',X1, Y1, X2, Y2);


[X, Y] = polybool('intersection',X3, Y3, X6, Y6);
end

if melon == 2
l = 500;w =500;

c_1 = c1 + [w/2,l/2,h1];   c_1g = c_1 - [0,0,h1];
c_2 = c1 + [w/2,-l/2,h1];  c_2g = c_2 - [0,0,h1];
c_3 = c1 + [-w/2,-l/2,h1]; c_3g = c_3 - [0,0,h1];
c_4 = c1 + [-w/2,l/2,h1];  c_4g = c_4 - [0,0,h1];

P1 = [0,0,h];
P2 = [10,9,h];
P3 = [25,27,h];

normal = cross(P1-P2,P2-P3);

[p1,ch1] = plane_line_intersect(normal,[0,0,h],R1,c_1);
[p2,ch2] = plane_line_intersect(normal,[0,0,h],R1,c_4);

p1_dash = [3000, p1(1,2) ,  h];
p2_dash = [0, p2(1,2) ,  h];

X1 = [p1_dash(1,1) p2_dash(1,1) 0 3000];
Y1 = [p1_dash(1,2) p2_dash(1,2) 3000 3000];

[p3,ch3] = plane_line_intersect(normal,[0,0,h],R2,c_1);
[p4,ch4] = plane_line_intersect(normal,[0,0,h],R2,c_4);

p3_dash = [3000, p3(1,2) , h];
p4_dash = [0, p4(1,2) , h];

X2 = [p3_dash(1,1) p4_dash(1,1) 0 3000];
Y2 = [p3_dash(1,2) p4_dash(1,2) 3000 3000];



[X3, Y3] = polybool('intersection',X1, Y1, X2, Y2);


c_1 = c2 + [w/2,l/2,h2];   c_1g = c_1 - [0,0,h2];
c_2 = c2 + [w/2,-l/2,h2];  c_2g = c_2 - [0,0,h2];
c_3 = c2 + [-w/2,-l/2,h2]; c_3g = c_3 - [0,0,h2];
c_4 = c2 + [-w/2,l/2,h2];  c_4g = c_4 - [0,0,h2];

P1 = [0,0,h];
P2 = [10,9,h];
P3 = [25,27,h];

normal = cross(P1-P2,P2-P3);

[p1,ch1] = plane_line_intersect(normal,[0,0,h],R1,c_2);
[p2,ch2] = plane_line_intersect(normal,[0,0,h],R1,c_3);

p1_dash = [3000, p1(1,2) , h];
p2_dash = [0, p2(1,2) , h];

X1 = [p1_dash(1,1) p2_dash(1,1) 0 3000];
Y1 = [p1_dash(1,2) p2_dash(1,2) 0 0];

[p3,ch3] = plane_line_intersect(normal,[0,0,h],R2,c_2);
[p4,ch4] = plane_line_intersect(normal,[0,0,h],R2,c_3);

p3_dash = [3000, p3(1,2) , h];
p4_dash = [0, p4(1,2) , h];

X2 = [p3_dash(1,1) p4_dash(1,1) 0 3000];
Y2 = [p3_dash(1,2) p4_dash(1,2) 0 0];

[X6, Y6] = polybool('intersection',X1, Y1, X2, Y2);


[X, Y] = polybool('intersection',X3, Y3, X6, Y6);

end

