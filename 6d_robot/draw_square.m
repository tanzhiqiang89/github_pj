%画正方形
close all;
clear;
syms px py pz;

%% 模型导入
build_6d_robot;

i=1
global Link
    T = zeros(3,1);
    T_x = zeros(1,100,'double');
    T_y = zeros(1,100,'double');
    T_z = zeros(1,100,'double'); 
px=10;
% for pz=-5:2:5
%     for py=-5:2:5
        
            p1 = [
         1   0    0    10;
         0   0   -1    5;
         0   1    0    -5;
         0   0    0    1]

            q1=robot.ikine(p1) %逆运动学
            robot.plot(q1);
            T=robot.fkine(q1).t  %正运动学
            
                T_x(1,i) = T(1); 
                T_y(1,i) = T(2); 
                T_z(1,i) = T(3); 
                i=i+1;
             plot3(T_x,T_y,T_z,'r.','MarkerSize',6);hold on;
%      end
% end   
grid on;   