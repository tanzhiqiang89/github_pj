%机械臂为六自由度机械臂
clear;
clc;
clear L;
%角度转换
du=pi/180;     %度
radian=180/pi; %弧度
 
%% 字符串法建立模型,
%q0=0;L0=0;%过渡关节

 
%% DH法建立模型,关节角，连杆偏移，连杆长度，连杆扭转角，关节类型（0转动，1移动）
L(1) = Link( 'd',0  ,  'a',0,   'alpha',pi/2, 'offset',0   );
L(2) = Link( 'd',0   ,  'a',5, 'alpha',-pi/2  , 'offset',0  );
L(3) = Link( 'd',0   ,  'a',0, 'alpha',pi/2  , 'offset',0   );
L(4) = Link( 'd',0   ,  'a',5,  'alpha',-pi/2, 'offset',0   );
L(5) = Link( 'd',0   ,  'a',0,   'alpha',pi/2 , 'offset',0);
L(6) = Link( 'd',0  ,  'a',5,   'alpha',0  ,  'offset',0  );
plotopt = {'noraise', 'nowrist', 'nojaxes', 'delay',0};
tool_char=[1 0 0 0;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];
robot=SerialLink(L,'name','6d robot','tool',tool_char);
 
%显示机械臂
figure(1)
hold on 
robot.plot([0 0 0 0 0 0], plotopt{:},'jointcolor',[1 1 0]);
hold off
