function check = search_infinity(x_uav, y_uav, x_target, y_target,a,b,c,d,Q,S,T,U,V,W,ud,h,sensor_range)
check = 0;

if(ud == 1)
    if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && inpolygon(x_uav,y_uav,Q(1,:),Q(2,:) ) ) || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && inpolygon(x_uav,y_uav,U(1,:),U(2,:)) ))
         if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) <sensor_range)
            check = 1;
    else
            check = 0;
         end
    end
end

if(ud == 5)
    if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && inpolygon(x_uav,y_uav,S(1,:),S(2,:) ))  || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && inpolygon(x_uav,y_uav,V(1,:),V(2,:) )))
         if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) <sensor_range)
            check = 1;
    else
            check = 0;
         end
    end
end

if(ud == 9)
    if((x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= 2875) && (y_target >= 125) && inpolygon(x_uav,y_uav,T(1,:),T(2,:) ) ) || (x_target <= 2875 && (x_target >=  125) && (y_target <= d(1,2) -250) && (y_target >= c(1,2) +250) && inpolygon(x_uav,y_uav,W(1,:),W(2,:) ) ))
         if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) <sensor_range)
            check = 1;
    else
            check = 0;
         end
    end
end
