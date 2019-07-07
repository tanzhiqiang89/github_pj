%完全版的绘画工作空间遍历
close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;

point1=[];
point2=[];
point3=[];
th_interval = 40;   %长度步长
z_interval = 4;     %角度步长

th1=0;
th2=-90;
th3=0;
d4=50;
th5=0;
th6=90;

global Link

num = 1
%这里采用“算出一点，绘制一点“的遍历方式
for theta1=-180:th_interval:180
    for theta2=-90:th_interval:90
        for theta3=-180:th_interval:0
            for dz4=-40:z_interval:200
                for theta5=-180:th_interval:180
                    for theta6=-90:th_interval:90
                        DHfk6Dof_Workplace(th1+theta1,th2+theta2,th3+theta3,d4+dz4,th5+theta5,th6+theta6,1,1);  %这里用来显示机械臂姿态
                        point1(num) = Link(7).p(1);
                        point2(num) = Link(7).p(2);
                        point3(num) = Link(7).p(3);
                        num = num + 1;
                        plot3(point1,point2,point3,'r*');  %绘点，这里用来显示末端执行器对应的点
						hold on;   %新旧图共存
                    end
                end
            end
        end
    end
end
cla;      %Clear current axes   
plot3(point1,point2,point3,'r*');   %plot3( )的用法与plot( )类似，只是多了一个 Z 数组。
axis([-400,400,-400,400,-400,400]);
grid on;



%hold on 和hold off，是相对使用的
%前者的意思是，你在当前图的轴（坐标系）中画了一幅图，再画另一幅图时，原来的图还在，与新图共存，都看得到
%后者表达的是，你在当前图的轴（坐标系）中画了一幅图，此时，状态是hold off,则再画另一幅图时，原来的图就看不到了，在轴上绘制的是新图，原图被替换了
