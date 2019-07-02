clc;
clear;

build_6d_robot;

% T1=transl(10,1,2);%根据给定起始点，得到起始点位姿
% T2=transl(10,5,2);%根据给定终止点，得到终止点位姿
T1=[
         1   0    0    10;
         0   0   -1    -5;
         0   1    0    2;
         0   0    0    1]
T2=[
         1   0    0    10;
         0   0   -1    5;
         0   1    0    2;
         0   0    0    1]
T=ctraj(T1,T2,50) %T是一个矩阵集合，并不是单纯的一个矩阵
Tj=transl(T);
plot3(Tj(:,1),Tj(:,2),Tj(:,3));%输出末端轨迹
grid on;
q=robot.ikine(T)   %由于T是个矩阵集合，所以q也是一个矩阵集合
hold on
robot.plot(q);%动画演示
