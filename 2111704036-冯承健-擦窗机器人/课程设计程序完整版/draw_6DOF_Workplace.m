close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;

point1=[];
point2=[];
point3=[];
th_interval = 40;
z_interval = 4;

th1=0;
th2=-90;
th3=0;
d4=50;
th5=0;
th6=90;

global Link

num = 1

for theta1=-180:th_interval:180
    for theta2=-90:th_interval:90
        for theta3=-180:th_interval:0
            for dz4=-40:z_interval:200
                for theta5=-180:th_interval:180
                    for theta6=-90:th_interval:90
                        DHfk6Dof_Workplace(th1+theta1,th2+theta2,th3+theta3,d4+dz4,th5+theta5,th6+theta6,1,1);
                        point1(num) = Link(7).p(1);
                        point2(num) = Link(7).p(2);
                        point3(num) = Link(7).p(3);
                        num = num + 1;
                        plot3(point1,point2,point3,'r*');hold on;
                    end
                end
            end
        end
    end
end
cla;
plot3(point1,point2,point3,'r*');
axis([-400,400,-400,400,-400,400]);
grid on;