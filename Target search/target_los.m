function zdot = target_los(t,z)

global k vt va r TIME 

theta = atan2(z(2) - z(5),z(1) - z(4));

wrap_theta = wrapTo2Pi(theta);
wrap_z6 = wrapTo2Pi(z(6));

disp('theta = ');
disp(theta);

disp('z6 = ');
disp(z(6));


if( z(8) >= 2249)
    z(3) = 0;
end

if( z(7) >= 2249)
    z(3) = 3*pi/2;
end

%{
if(wrap_z6 - wrap_theta>pi)
    wrap_theta = -2*(wrap_z6-pi) + wrap_theta;
end
if(wrap_z6 - wrap_theta<-pi)
    wrap_theta = -2*(wrap_z6+pi) + wrap_theta;
end
if(wrap_z6 - wrap_theta<0) && (wrap_z6 - wrap_theta>=-pi)
    wrap_theta =   wrap_theta;
end 
if(wrap_z6 - wrap_theta>=0) && (wrap_z6 - wrap_theta<=pi)
    wrap_theta =  wrap_theta;
end    
%}

z1dot = 0 * cos(z(3));
z2dot = 0 * sin(z(3));
z3dot = 0;

z7dot = vt * cos(z(3));
z8dot = vt * sin(z(3));
   
z4dot = va * cos(z(6));
z5dot = va * sin(z(6));

u = - k*(z(6) - theta);

if(u>r*9.8)
    u = r*9.8;
end
if(u<-r*9.8)
    u = -r*9.8;
end


TIME = [TIME t];
z6dot = u/va;




zdot = [z1dot;z2dot;z3dot;z4dot;z5dot;z6dot;z7dot;z8dot];
