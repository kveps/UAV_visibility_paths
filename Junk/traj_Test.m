clc;clear all;
va = 10;
vt = 5;
min_Rad = 1;
t = 1/5;
for ink = 1:1:100
Wi = [0,50];Wf = [100,50];
line([Wi(1,1),Wf(1,1)],[Wi(1,2),Wf(1,2)],'color','g');
 if(ink == 1)
 uav_st = [0,40];
 plot(uav_st(1,1),uav_st(1,2),'-x','MarkerSize',5);
 chi = 0;
 end
 Ru = sqrt( ((Wi(1,1) - uav_st(1,1))^2)  + ((Wi(1,2) - uav_st(1,2))^2)  )
 theta = atan2(Wf(1,2) - Wi(1,2) , Wf(1,1) - Wi(1,1))
 theta_u = atan2(uav_st(1,2) - Wi(1,2),uav_st(1,1) - Wi(1,1))
 beta = theta - theta_u
 R = sqrt(Ru^2 - (Ru*sin(beta))^2)
 x_t = (R+ink)*cos(theta)
 y_t = (R+ink)*sin(theta)+50
 chi_d = (atan2(y_t - uav_st(1,2),x_t - uav_st(1,1)))
 chi_r = chi_d*180/pi
 x_dot =(va*cos(chi_d))
 y_dot =(va*sin(chi_d))
 x_uav = x_dot*t + uav_st(1,1);
 y_uav = y_dot*t + uav_st(1,2);
 
 plot(x_t,y_t,'-o','MarkerSize',5);
 hold on
 plot(x_uav,y_uav,'-x','MarkerSize',5)
%comet(x_uav,y_uav)
axis([0 100 0 100]);
axis('square');
uav_st(1,1) = x_uav;uav_st(1,2) = y_uav;
chi = chi_d;
pause(t);
hold on 

M(ink) = getframe;
if (x_uav >= Wf(1,1))
    break;
end

end

%movie(M,3,1);


