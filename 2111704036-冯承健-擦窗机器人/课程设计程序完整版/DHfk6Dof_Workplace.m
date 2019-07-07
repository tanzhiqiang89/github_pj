%这是一个函数，输入6个关节后，就可以在这里获得对应的机械臂姿态
function pic=DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6,fcla,fplot)
% close all
global Link

Build_6DOFRobot;
radius    = 10;
len       =   20;
joint_col = 0;


plot3(0,0,0,'ro'); 

Link(2).th=th1*pi/180;
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).dz=d4;
Link(6).th=th5*pi/180;
Link(7).th=th6*pi/180;
 
 %Link(2).th=Link(2).th+th1*pi/180;
 %Link(3).th=Link(3).th+th2*pi/180;
 %Link(4).th=Link(4).th+th3*pi/180;
 %Link(4).dy=Link(4).dy+y3;
 %Link(6).th=Link(6).th+th5*pi/180;
 %Link(7).th=Link(7).th+th6*pi/180;

p0=[0,0,0]';

for i=1:7
Matrix_DH_Ln(i);     %1到7的正运动学变换矩阵
end

for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;  %6个矩阵相乘，得出总变换矩阵。
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
      if fplot
          Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
      end
end


grid on;
% view(134,12);
axis([-600,600,-600,600,-400,700]);   %三维画图空间限制
xlabel('x');                    %坐标标签
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;

if(fcla)
    cla;
end


