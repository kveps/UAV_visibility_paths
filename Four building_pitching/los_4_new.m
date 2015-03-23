function zdot = los_4_new(t,z)

global k kp vt va r U TIME X Y

h_dash = 600;

theta = atan2(z(2) - z(5),z(1) - z(4));

%{
wrap_theta = wrapTo2Pi(theta);
wrap_z(7) = wrapTo2Pi(z(7));
if(wrap_z(7) - wrap_theta>pi)
    wrap_theta = -2*(wrap_z(7)-pi) + wrap_theta;
end
if(wrap_z(7) - wrap_theta<-pi)
    wrap_theta = -2*(wrap_z(7)+pi) + wrap_theta;
end
if(wrap_z(7) - wrap_theta<0) && (wrap_z(7) - wrap_theta>=-pi)
    wrap_theta =   -wrap_theta;
end 
if(wrap_z(7) - wrap_theta>=0) && (wrap_z(7) - wrap_theta<=pi)
    wrap_theta =  wrap_theta;
end    
%}

z1dot = vt * cos(z(3));
z2dot = vt * sin(z(3));
z3dot = 0;


if ((inpolygon(z(4),z(5),X,Y)) || z(1) > 1000) 
z4dot = va * cos(z(7))*cos(z(8));
z5dot = va * sin(z(7))*cos(z(8));
z6dot = va*sin(z(8));
u = -k*(z(7) - theta);
u_p = -kp*z(8);
if(u>r*9.8)
    u = r*9.8;
end
if(u<-r*9.8)
    u = -r*9.8;
end

U = [U u];
TIME = [TIME t];
z7dot = u/(va*cos(z(8)));
z8dot = u_p /(va);

else
    
z4dot = va * cos(z(7))*cos(z(8));
z5dot = va * sin(z(7))*cos(z(8));
z6dot = va * sin(z(8));
u = -k*(z(7) - pi/2);
u_p = 0.5;

if(u>r*9.8)
    u = r*9.8;
end
if(u<-r*9.8)
    u = -r*9.8;
end

U = [U u];
TIME = [TIME t];
z7dot = u/(va*cos(z(8)));
z8dot = u_p /(va);
end

if(z(6) ~= h_dash)
    h_dash = z(6);
   [X Y Z] = visibility(h_dash);
end

zdot = [z1dot;z2dot;z3dot;z4dot;z5dot;z6dot;z7dot;z8dot];
