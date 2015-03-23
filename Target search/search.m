function check = search(x_uav, y_uav, x_target, y_target,visibility,visibility1,visibility2,a,b,c,d,h,sensor_range)
check = 0;

if (x_target <= (b(1,1)+250) && (x_target >=  (c(1,1)-250)) && (y_target <= d(1,2) -250) && (y_target >= c(1,2)+250))
    if( inpolygon(x_uav,y_uav,visibility2(1,:),visibility2(2,:) ) )
        if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) <sensor_range)
            check = 1;
    else
            check = 0;
        end
    end
end


if (x_target <= (b(1,1)-250) && (x_target >=  (c(1,1)+250)) && (y_target <= d(1,2) +250) && (y_target >= c(1,2)-250))
    if( inpolygon(x_uav,y_uav,visibility1(1,:),visibility1(2,:) ) )
         if( ((((x_uav - x_target)^2) + ((y_uav - y_target)^2) + ((h - 0)^2))^0.5) < sensor_range)
            check = 1;
    else
            check = 0;
         end
    end
end

%{
if (x_target <= (b(1,1)+250) && (x_target >=  (c(1,1)-250)) && (y_target <= d(1,2) +250) && (y_target >= c(1,2)-250))
    if( inpolygon(x_uav,y_uav,visibility(1,:),visibility(2,:) ) )
            check = 1;
    else
            check = 0;
    end
end
%}