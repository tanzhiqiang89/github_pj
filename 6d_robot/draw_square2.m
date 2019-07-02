close all;
clear;

global Link

ToDeg = 180/pi;
ToRad = pi/180;

th1=0;
th2=0;
th3=0;
th4=0;
th5=0;
th6=0;
figure(1);
DHfk6Dof(th1,th2,th3,th4,th5,th6,1,1);

p = [100 50 -50 1; 
    100 -50 -50 1; 
    100 -50 50 1;
    100 50 50 1;
    100 50 -50 1];

point_num=10; %分成十段
point1=[];
point2=[];
point3=[];
num=1;
% target_z = [-sqrt(2)/2.0 0 sqrt(2)/2.0 0]'; %target_z等于[-0.7071;0;0.7071;0]
target_z = [-1/2.0 0 1/2.0 0]';
%target_z = [0 0 0 0]';
Target.A = Link(7).A;
det = target_z - Link(7).A(:,1);  %这是什么意思？det是个差值

for i=1:5       %为什么要循环5次，
     Target.A = Link(7).A;
     Target.A(:,1) = Link(7).A(:,1) + det*1/5;   %这里为五分之一，所以要循环5遍？
     [th1,th2,th3,th4,th5,th6] = Move_IK(th1,th2,th3,th4,th5,th6,Target);   %这个是由当前6轴状态，通过雅可比推出下一个6轴的状态
     figure(1);
     DHfk6Dof(th1,th2,th3,th4,th5,th6,1,1);    %根据提供的6个关节角，输出机械臂姿态
end

for i=1:size(p,1)   %获得p矩阵行数
    det = p(i,:)' - Link(7).A(:,4);
    if i==1
        N=10;
    else
        N=point_num;
    end
    for j=1:N  %分成10段，所以要循环10次
        Target.A = Link(7).A;
        Target.A(:,1)=target_z;
        Target.A(:,4) = Link(7).A(:,4) + det*1/N;
        [th1,th2,th3,th4,th5,th6] = Move_IK(th1,th2,th3,th4,th5,th6,Target);
        figure(1);
        DHfk6Dof(th1,th2,th3,th4,th5,th6,1,1);
        if i>1
            [x,y,z] = BrushCylinder(Link(7).p, Link(7).R * Link(8).az, 12);
            point1=[point1;x];
            point2=[point2;y];
            point3=[point3;z];
            patch(point1',point2',point3','r','edgealpha',0);hold on;
			%patch是个底层的图形函数，用来创建补片图形对象。
			%一个补片对象是由其顶点坐标确定的一个或多个多边形。用户可以指定补片对象的颜色和灯光。
            num=num+1;
        end
    end
end
DHfk6Dof(th1,th2,th3,th4,th5,th6,0,1);


