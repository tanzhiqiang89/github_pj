function pic=DHfk6Dof_Workplace(th1,th2,th3,th4,th5,th6,fcla,fplot)  %���������������ռ�ĺ����ں�
% close all
global Link


Build_6DOFRobot;
radius    = 10;
len       =   20;
joint_col = 0;


plot3(0,0,0,'ro'); 

Link(2).th=th1*pi/180;           %��ɻ��ȣ�th1ȡ��draw_6DOF_Workplace��
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).th=th4*pi/180;
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
Matrix_DH_Ln(i);  %���ɹؽ����ӵ�D-H����
end

for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;     %��i+1������˵�i�����󣬾����ҳˣ������о�����ˡ� Link(i)����ȡ��Matrix_DH_Ln(i)��
      Link(i).p= Link(i).A(:,4);     %ȡLink(i).A�������еĵ�4�зŵ�Link(i).p���ѵ�i���ؽڵ�λ�ô���Link(i).p�С�
      Link(i).n= Link(i).A(:,1);     %ͬ��
      Link(i).o= Link(i).A(:,2);     %ͬ��
      Link(i).a= Link(i).A(:,3);     %ͬ��
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];  %�ѵ�i���ؽڵ���̬���� Link(i).R��
      if fplot   %��fplotΪ1ʱִ��������������
          Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;             %'b'����ָ����Ϊ��ɫ��Link(i)����ȡ��Matrix_DH_Ln(i)������  ��hold on ������ǰ�������еĻ�ͼ���Ӷ�ʹ����ӵ��������еĻ�ͼ����ɾ�����л�ͼ��
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;   %��ԲͲ
      end
end


grid on;
% view(134,12);
axis([-200,200,-200,200,-200,200]);    %ָ����Χ
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;

if(fcla)
    cla;
end


