%��е��Ϊ�����ɶȻ�е��
clear;
clc;
clear L;
%�Ƕ�ת��
du=pi/180;     %��
radian=180/pi; %����
 
%% �ַ���������ģ��,
%q0=0;L0=0;%���ɹؽ�

 
%% DH������ģ��,�ؽڽǣ�����ƫ�ƣ����˳��ȣ�����Ťת�ǣ��ؽ����ͣ�0ת����1�ƶ���
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
 
%��ʾ��е��
figure(1)
hold on 
robot.plot([0 0 0 0 0 0], plotopt{:},'jointcolor',[1 1 0]);
hold off
