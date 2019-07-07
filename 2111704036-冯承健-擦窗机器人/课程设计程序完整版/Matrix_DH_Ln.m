function Matrix_DH_Ln(i) 
% Caculate the D-H Matrix
global Link

ToDeg = 180/pi;
ToRad = pi/180;


C=cos(Link(i).th);     %Link(i).th是输入变量
S=sin(Link(i).th);
Ca=cos(Link(i).alf);
Sa=sin(Link(i).alf);
a=Link(i).dx;    %distance between zi and zi-1
d=Link(i).dz;    %distance between xi and xi-1
y=Link(i).dy;

Link(i).n=[C,S,0,0]';        %正运动学变换矩阵，见书本57页
Link(i).o=[-1*S*Ca,C*Ca,Sa,0]';
Link(i).a=[S*Sa, -1*C*Sa,Ca,0]';
Link(i).p=[a*C-y*S,a*S+y*C,d,1]';

Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];    %收集姿态
Link(i).A=[Link(i).n,Link(i).o,Link(i).a,Link(i).p];      %整合


