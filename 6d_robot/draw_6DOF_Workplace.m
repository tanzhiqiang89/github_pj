close all;    %ɾ������δ���ص�����ͼ����
clear;        %��������ռ�

ToDeg = 180/pi;   %ת��Ϊ����
ToRad = pi/180;   %ת��Ϊ����

point1=[];    %��Ϊ����
point2=[];
point3=[];
th_interval = 20;    %�����
% z_interval = 4;      %�߼��

th1=0;   %Ϊth1��th6�趨��ʼֵ
th2=0;
th3=0;
th4=0;
th5=0;
th6=0;

global Link

num = 1;

for theta1=-40:th_interval:40   %ѭ���������ռ�
    for theta2=-40:th_interval:40
        for theta3=-40:th_interval:40
            for theta4=-40:th_interval:40
                for theta5=-40:th_interval:40
                    for theta6=-40:th_interval:40
                        DHfk6Dof_Workplace(th1+theta1,th2+theta2,th3+theta3,th4+theta4,th5+theta5,th6+theta6,1,1);
                        point1(num) = Link(7).p(1);    %����������������ݣ����ﹲ����������
                        point2(num) = Link(7).p(2);
                        point3(num) = Link(7).p(3);
                        num = num + 1;
                        plot3(point1,point2,point3,'r*');hold on;   %��������point1,point2,point3�������� point1(num)��point2(num), point3(num)?  
                    end
                end
            end
        end
    end
end
cla;       %cla �ӵ�ǰ������ɾ�������ɼ����������ͼ�ζ��󣬰������ͼ�������
plot3(point1,point2,point3,'r*');      %�����ٻ�һ��ͼ��
axis([-200,200,-200,200,-200,200]);    %�����᷶Χ���ݺ��
grid on;                %��ʾ gca ����صĵ�ǰ��������ͼ���������ߡ��������ߴ�ÿ���̶������졣grid off ɾ����ǰ��������ͼ�ϵ����������ߡ�