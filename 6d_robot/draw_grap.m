clear;
clc;
L1 = Link('d', 0, 'a', 0, 'alpha', pi/2,'offset',0);    %Link 类函数
L2 = Link('d', 0, 'a', 5, 'alpha', -pi/2,'offset',0);
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2,'offset',0);
L4 = Link('d', 0, 'a', 5, 'alpha', -pi/2,'offset',0);
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2,'offset',0);
L6 = Link('d', 0, 'a', 5, 'alpha', 0,'offset',0);

b=isrevolute(L1);  %Link 类函数
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink 类函数
robot.display();  %Link 类函数
