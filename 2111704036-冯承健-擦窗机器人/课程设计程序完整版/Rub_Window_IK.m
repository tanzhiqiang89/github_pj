%这是擦窗的m文件。这个文件调用的m文件有，DHfk6Dof，Move_IK
close all;
clear;

global Link

ToDeg = 180/pi;
ToRad = pi/180;

th1=0;
th2=-135;
th3=-90;
d4=30;
th5=90;
th6=135;
figure(1);
DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);
view(134,12);       %这个是画出那个窗户的
DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);

pause;

% given trace给定轨迹
%1 is rub five-pointed star track; 0 is cos track.
%1是五角星轨迹，0是cos轨迹，其中获得一个p为下面所使用
track=1;
if (track) 
    p = [0 0 92 1; 0 20 21 1; 0 96 21 1;0 36 -21 1; 0 58 -91 1;
            0 0 -47 1;0 -58 -91 1;0 -36 -21 1;0 -96 21 1;0 -20 21 1;0 0 92 1]; %五角星需要十个点，一共十一个点走完，
else
    z=4*pi:-pi/2:-4*pi;
    y=cos(z)*80;
    z=z*80/(4*pi);
    x=zeros(size(z));
    n=ones(size(z));
    p=[x;y;z;n]';
end

centre_point=[-200,0,345,1];

for i=1:4
    p(:,i)=p(:,i)+centre_point(i); %对图像（包括五角星和cos轨迹）进行偏移，让其在中间显示
end

%how many point bwteen two adjacent ponit
%相邻两点的距离分成多少段
point_num=10; %分成十段

point1=[];
point2=[];
point3=[];
num=1;


% target pose目标姿态，这是姿态的测试段，不用也行
target_z = [-sqrt(2)/2.0 0 sqrt(2)/2.0 0]'; %target_z等于[-0.7071;0;0.7071;0]
Target.A = Link(7).A;
det = target_z - Link(7).A(:,1);  %这是什么意思？det是个差值

for i=1:5       %为什么要循环5次，
     Target.A = Link(7).A;
     Target.A(:,1) = Link(7).A(:,1) + det*1/5;   %这里为五分之一，所以要循环5遍？知道了下一步的位置点
     [th1,th2,th3,d4,th5,th6] = Move_IK(th1,th2,th3,d4,th5,th6,Target);   %这个是由当前6轴状态，通过雅可比推出下一个6轴的状态
     figure(1);
     DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);    %根据提供的6个关节角，输出机械臂姿态
end


% rub wondow擦窗，这段是执行段
%size(A,n)如果在size函数的输入参数中再添加一项n，并用1或2为n赋值，则 size将返回矩阵的行数或列数。
%其中r=size(A,1)该语句返回的时矩阵A的行数， c=size(A,2) 该语句返回的时矩阵A的列数。
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
        [th1,th2,th3,d4,th5,th6] = Move_IK(th1,th2,th3,d4,th5,th6,Target);
        figure(1);
        DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);
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
DHfk6Dof(th1,th2,th3,d4,th5,th6,0,1);