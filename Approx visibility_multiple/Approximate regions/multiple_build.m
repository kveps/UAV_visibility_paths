%function [W1,W2,W3,W4,W5,W6,W7,W8,W9,h] = multiple_build();
clc;
clear all;
rotate3d;

for t = 1:1:9

h = 400;%input('Enter the height of UAV: ');
const1 = 0;const2 = 1500;

ad(t,:) = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
bd(t,:) = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');
cd(t,:) = [500,500,0];%input('Enter [l,w,h] of 1st building: ');
dd(t,:) = [500,500,0];%input('Enter [l,w,h] of 2nd 1building: ');

switch(t)
    case 1
        i = 0;
        j = 0;
        ad(1,3)= 280;bd(1,3) = 270;cd(1,3)= 300;dd(1,3) = 315;

    case 2
        i = 750;
        j = 0;
        ad(2,3)= 350;bd(2,3) = 320;cd(2,3)= 270;dd(2,3) = 280;
        
    case 3
        i = 1500;
        j = 0;
        ad(3,3)= 296;bd(3,3) = 277;cd(3,3)= 320;dd(3,3) = 350;
        
    case 4
        i = 0;
        j = 750;
        ad(4,3)= 270;bd(4,3) = 280;cd(4,3)= 315;dd(4,3) = 270;
        
    case 5
        i = 750;
        j = 750;
        ad(5,3)= 260;bd(5,3) = 350;cd(5,3)= 280;dd(5,3) = 270;
        
    case 6
        i = 1500;
        j = 750;
        ad(6,3)= 260;bd(6,3) = 296;cd(6,3)= 350;dd(6,3) = 260;
        
    case 7
        i = 0;
        j = 1500;
        ad(7,3)= 280;bd(7,3) = 270;cd(7,3)= 270;dd(7,3) = 315;
        
    case 8
        i = 750;
        j = 1500;
        ad(8,3)= 310;bd(8,3) = 260;cd(8,3)= 270;dd(8,3) = 280;
        
    case 9
        i = 1500;
        j = 1500;
        ad(9,3)= 250;bd(9,3) = 260;cd(9,3)= 260;dd(9,3) = 310;
        
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
 
voxel(a(t,:) + [-wa/2,-la/2,0],[wa la ha],[0.8 0.5 0],0.7);
voxel(b(t,:) + [-wb/2,-lb/2,0],[wb lb hb],[0.8 0.5 0],0.7);
voxel(c(t,:) + [-wc/2,-lc/2,0],[wc lc hc],[0.8 0.5 0],0.7);
voxel(d(t,:) + [-wd/2,-ld/2,0],[wd ld hd],[0.8 0.5 0],0.7);
 

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
    
   if k == 1
       Q(1,:) = X; Q(2,:) = Y; Q(3,:) = Z;
   end
   if k == 2
       S(1,:) = X; S(2,:) = Y; S(3,:) = Z;
   end
   if k == 3
       T(1,:) = X; T(2,:) = Y; T(3,:) = Z;
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

   if k == 1
      U(1,:) = X; U(2,:) = Y; U(3,:) = Z;
   end
   if k == 4
       V(1,:) = X; V(2,:) = Y; V(3,:) = Z;
   end
   if k == 7
       W(1,:) = X; W(2,:) = Y; W(3,:) = Z;
   end
   patch(X,Y,Z,'green');
   
   hold on 
   
end

[W1(1,:),W1(2,:)]= polybool('intersection',Q(1,:),Q(2,:),U(1,:),U(2,:));
[W2(1,:),W2(2,:)]= polybool('intersection',S(1,:),S(2,:),U(1,:),U(2,:));
[W3(1,:),W3(2,:)]= polybool('intersection',T(1,:),T(2,:),U(1,:),U(2,:));

[W4(1,:),W4(2,:)]= polybool('intersection',T(1,:),T(2,:),V(1,:),V(2,:));
[W5(1,:),W5(2,:)]= polybool('intersection',S(1,:),S(2,:),V(1,:),V(2,:));
[W6(1,:),W6(2,:)]= polybool('intersection',Q(1,:),Q(2,:),V(1,:),V(2,:));

[W7(1,:),W7(2,:)]= polybool('intersection',Q(1,:),Q(2,:),W(1,:),W(2,:));
[W8(1,:),W8(2,:)]= polybool('intersection',S(1,:),S(2,:),W(1,:),W(2,:));
[W9(1,:),W9(2,:)]= polybool('intersection',T(1,:),T(2,:),W(1,:),W(2,:));


%{
for i = 1:1:numel(W1(1,:))
    W1(3,:) = h;
end
for i = 1:1:numel(W2(1,:))
    W2(3,:) = h;
end
for i = 1:1:numel(W3(1,:))
    W3(3,:) = h;
end
for i = 1:1:numel(W4(1,:))
    W4(3,:) = h;
end
for i = 1:1:numel(W5(1,:))
    W5(3,:) = h;
end
for i = 1:1:numel(W6(1,:))
    W6(3,:) = h;
end
for i = 1:1:numel(W7(1,:))
    W7(3,:) = h;
end
for i = 1:1:numel(W8(1,:))
    W8(3,:) = h;
end
for i = 1:1:numel(W9(1,:))
    W9(3,:) = h;
end

patch(W1(1,:),W1(2,:),W1(3,:),'green');hold on

patch(W2(1,:),W2(2,:),W2(3,:),'green');hold on

patch(W3(1,:),W3(2,:),W3(3,:),'green');hold on

patch(W4(1,:),W4(2,:),W4(3,:),'green');hold on

patch(W5(1,:),W5(2,:),W5(3,:),'green');hold on

patch(W6(1,:),W6(2,:),W6(3,:),'green');hold on

patch(W7(1,:),W7(2,:),W7(3,:),'green');hold on

patch(W8(1,:),W8(2,:),W8(3,:),'green');hold on

patch(W9(1,:),W9(2,:),W9(3,:),'green');

%}
