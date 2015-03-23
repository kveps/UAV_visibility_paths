function check = search(x_uav, y_uav, x_target, y_target,visibility,visibility1,visibility2,cent1,cent2,a,b,c,d,ud,h,sensor_range)
check = 0;

if(ud == 1)
if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && x_uav+10 >= cent1 && y_uav+10 >= cent2) || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && x_uav+10 >= cent1 && y_uav+10>= cent2 ))
        if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) <sensor_range)
            check = 1;
    else
            check = 0;
        end
    end
end

if (ud == 5)
if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && x_uav + 10 >= cent1 && y_uav + 10 >= cent2)  || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && x_uav + 10 >= cent1 && y_uav+10 >= cent2))
         if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) < sensor_range)
            check = 1;
    else
            check = 0;
         end
    end
end

if(ud == 9)
if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && x_uav + 10>= cent1 && y_uav+10 >= cent2 ) || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && x_uav+10 >=cent1 && y_uav +10>= cent2))
            check = 1;
    else
            check = 0;
    end
end
