clc;clear all;
close all;

rotate3d;

for t = 1:1:9
    
const1 = 0;const2 = 1500;%Do not change these values

h = 400;%Height of which UAV is flying. Also height at which green patches are formed

length = 500;%both length and width of buildings should be same and it is the same for all buildings
width = 500;

h1 = 300; h2 = 270; h3 = 320; h4 = 277;% Specify heights of 16 buildings in order as below
h5 = 296; h6 = 350; h7 = 280; h8 = 315;
h9 = 270; h10 = 270; h11 = 260; h12 = 260;
h13 = 250; h14 = 310; h15 = 280; h16 = 315;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Order of numbering of buildings for specifying height h1..........h16
%
%                             16           15               14              13  
%                             9             10               11               12
%                             8               7                  6                 5
%                             1               2                  3                 4
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%DO NOT CHANGE ANYTHING AFTER THIS

ad(t,:) = [length,width,0];
bd(t,:) = [length,width,0];
cd(t,:) = [length,width,0];
dd(t,:) = [length,width,0];

switch(t)
    case 1
        i = 0;
        j = 0;
        ad(1,3)= h7;bd(1,3) = h2;cd(1,3)= h1;dd(1,3) = h8;

    case 2
        i = 750;
        j = 0;
        ad(2,3)= h6;bd(2,3) = h3;cd(2,3)= h2;dd(2,3) = h7;
        
    case 3
        i = 1500;
        j = 0;
        ad(3,3)= h5;bd(3,3) = h4;cd(3,3)= h3;dd(3,3) = h6;
        
    case 4
        i = 0;
        j = 750;
        ad(4,3)= h10;bd(4,3) = h7;cd(4,3)= h8;dd(4,3) = h9;
        
    case 5
        i = 750;
        j = 750;
        ad(5,3)= h11;bd(5,3) = h6;cd(5,3)= h7;dd(5,3) = h10;
        
    case 6
        i = 1500;
        j = 750;
        ad(6,3)= h12;bd(6,3) = h5;cd(6,3)= h6;dd(6,3) = h11;
        
    case 7
        i = 0;
        j = 1500;
        ad(7,3)= h15;bd(7,3) = h10;cd(7,3)= h9;dd(7,3) = h16;
        
    case 8
        i = 750;
        j = 1500;
        ad(8,3)= h14;bd(8,3) = h11;cd(8,3)= h10;dd(8,3) = h15;
        
    case 9
        i = 1500;
        j = 1500;
        ad(9,3)= h13;bd(9,3) = h12;cd(9,3)= h11;dd(9,3) = h14;
        
end

wr = 250;%input('Enter width of the road: ');
wrs = 250;

a(t,:) = [1125+i,1125+j,0];%input('Enter centre of building: ');
b(t,:) = [1125+i,375+j,0];
c(t,:) = [375+i,375+j,0];
d(t,:) = [375+i,1125+j,0];

la = ad(t,1);wa = ad(t,2);ha = ad(t,3);
lb = bd(t,1);wb = bd(t,2);hb = bd(t,3);
lc = cd(t,1);wc = cd(t,2);hc = cd(t,3);
ld = dd(t,1);wd = dd(t,2);hd = dd(t,3);
 
voxel(a(t,:) + [-wa/2,-la/2,0],[wa la ha],'c',0.7);
voxel(b(t,:) + [-wb/2,-lb/2,0],[wb lb hb],'c',0.7);
voxel(c(t,:) + [-wc/2,-lc/2,0],[wc lc hc],'c',0.7);
voxel(d(t,:) + [-wd/2,-ld/2,0],[wd ld hd],'c',0.7);
 

axis([0 3000 0 3000]);
axis('square');

hold on 

end

for k = 1:1:3
    
    max1 = max([cd(k,3) dd(k,3) cd(k+6,3) dd(k+6,3)]);
    if max1 == cd(k,3)
        cen1 = c(k,:);
    end
    if max1 == dd(k,3)
        cen1 = d(k,:);
    end
    if max1 == cd(k+6,3)
        cen1 = c(k+6,:);
   end 
   if max1 == dd(k+6,3)
        cen1 = d(k+6,:);
   end
        
    max2 = max([ad(k,3) bd(k,3) ad(k+6,3) bd(k+6,3)]);
    if max2 == ad(k,3)
        cen2 = a(k,:);
    end
    if max2 == bd(k,3)
        cen2 = b(k,:);
    end
    if max2 == ad(k+6,3)
        cen2 = a(k+6,:);
   end 
   if max2 == bd(k+6,3)
        cen2 = b(k+6,:);
   end  
   
   if k==1
   R1 = [750, 125.01,0]; R2 = [750, 2874.99,0];
   end
   
   if k==2
   R1 = [1500, 125.01,0]; R2 = [1500, 2874.99 ,0];
   end
   
   if k==3
   R1 = [2250, 125.01,0]; R2 = [2250, 2874.99,0];
   end
   
   melon = 1;
   [X,Y] = approx_visiblity(max1, cen1, max2, cen2,h, R1, R2,melon);
    
  num = numel(X);

for too = 1:1:num;
    Z(too,1) = h;
end
   patch(X,Y,Z,'green');
   
   hold on 
   
end

for k = 1:3:7
    
    max1 = max([cd(k,3) bd(k,3) cd(k+2,3) bd(k+2,3)]);
    if max1 == cd(k,3)
        cen1 = c(k,:);
    end
    if max1 == bd(k,3)
        cen1 = b(k,:);
    end
    if max1 == cd(k+2,3)
        cen1 = c(k+2,:);
   end 
   if max1 == bd(k+2,3)
        cen1 = b(k+2,:);
   end
        
    max2 = max([dd(k,3) ad(k,3) dd(k+2,3) ad(k+2,3)]);
    if max2 == dd(k,3)
        cen2 = d(k,:);
    end
    if max2 == ad(k,3)
        cen2 = a(k,:);
    end
    if max2 == dd(k+2,3)
        cen2 = d(k+2,:);
   end 
   if max2 ==ad(k+2,3)
        cen2 = a(k+2,:);
   end  
   
   if k==1
   R1 = [125.01,750, 0]; R2 = [2874.99,750, 0];
   end
   
   if k==4
   R1 = [125.01,1500, 0]; R2 = [2874.99 ,1500, 0];
   end
   
   if k==7
   R1 = [125.01,2250, 0]; R2 = [2874.99,2250, 0];
   end
   
   melon =2;
   [X,Y] = approx_visiblity(max1, cen1, max2, cen2,h, R1, R2,melon);
    
  num = numel(X);

for too = 1:1:num;
    Z(too,1) = h;
end
   patch(X,Y,Z,'green');
   
   hold on 
   
end