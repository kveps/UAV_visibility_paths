function zdot = los(t,z)

global k vt va r U TIME

theta = atan2(z(2) - z(5),z(1) - z(4));

wrap_theta = wrapTo2Pi(theta);
wrap_z(6) = wrapTo2Pi(z(6));
if(wrap_z(6) - wrap_theta>pi)
    wrap_theta = -2*(wrap_z(6)-pi) + wrap_theta;
end
if(wrap_z(6) - wrap_theta<-pi)
    wrap_theta = -2*(wrap_z(6)+pi) + wrap_theta;
end
if(wrap_z(6) - wrap_theta<0) && (wrap_z(6) - wrap_theta>=-pi)
    wrap_theta =   -wrap_theta;
end 
if(wrap_z(6) - wrap_theta>=0) && (wrap_z(6) - wrap_theta<=pi)
    wrap_theta =  wrap_theta;
end    


z1dot = vt * cos(z(3));
z2dot = vt * sin(z(3));
z3dot = 0;

%if (z(4) < 657)
%z4dot = 25 * cos(z(6));
%z5dot = 25 * sin(z(6));
%u = -k*(wrap_z(6));
%if(u>r*9.8)
%    u = r*9.8;
%end
%if(u<-r*9.8)
%    u = -r*9.8;
%end

%U = [U u];
%TIME = [TIME t];
%z6dot = u/va;


%else    
z4dot = va * cos(z(6));
z5dot = va * sin(z(6));

u = -k*(wrap_z(6) - wrap_theta);
if(u>r*9.8)
    u = r*9.8;
end
if(u<-r*9.8)
    u = -r*9.8;
end

U = [U u];
TIME = [TIME t];
z6dot = u/va;


zdot = [z1dot;z2dot;z3dot;z4dot;z5dot;z6dot];
