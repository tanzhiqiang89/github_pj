%六轴机械臂工作空间计算
clc;
clear;
format short;%保留精度
 
%角度转换
du=pi/180;  %度
radian=180/pi; %弧度
 
%% 模型导入
 build_6d_robot;

%% 求取工作空间
    %关节角限位
    q1_s=-40;   q1_end=40;
    q2_s=-40;   q2_end=40;
    q3_s=-40;   q3_end=40;
    q4_s=-40;   q4_end=40;
    q5_s=-40;   q5_end=40;
    q6_s=-40;   q6_end=40;
    
    %设置step
    step=20;%计算步距
    step1= (q1_end -q1_s) / step;
    step2= (q2_end -q2_s) / step;
    step3= (q3_end -q3_s) / step;
    step4= (q4_end -q4_s) / step;
    step5= (q5_end -q5_s) / step;
    step6= (q6_end -q6_s) / step;
    
    %计算工作空间
    tic;%tic1
    i=1;
    T = zeros(3,1);
    T_x = zeros(1,step1*step2*step3*step4*step5,'int8');
    T_y = zeros(1,step1*step2*step3*step4*step5,'int8');
    T_z = zeros(1,step1*step2*step3*step4*step5,'int8');  
    for  q1=q1_s:step:q1_end
        for  q2=q2_s:step:q2_end
              for  q3=q3_s:step:q3_end
                  for  q4=q4_s:step:q4_end
                      for q5=q5_s:step:q5_end
                          for q6=q6_s:step:q6_end
                            %  robot.plot([q1*du q2*du q3*du q4*du q5*du q6*du],'jointcolor',[1 1 0]);   %让机器人机体运动到指定姿态
                              T=robot.fkine([q1*du q2*du q3*du q4*du q5*du q6*du]).t;%正向运动学仿真函数
                              T_x(1,i) = T(1); 
                              T_y(1,i) = T(2); 
                              T_z(1,i) = T(3); 
                              i=i+1;
                              plot3(T_x,T_y,T_z,'r.','MarkerSize',6);hold on;
                          end
                      end
                 end
             end
        end 
    end
    disp(['循环运行时间：',num2str(toc)]); 
    t1=clock;
     
%% 绘制工作空间
figure('name','6d-robot工作空间')
hold on
plotopt = {'noraise', 'nowrist', 'nojaxes', 'delay',0};
robot.plot([0 0 0 0 0 0], plotopt{:});
disp(['绘制工作空间运行时间：',num2str(etime(clock,t1))]);  
plot3(T_x,T_y,T_z,'r.','MarkerSize',6);

Point_range = [min(T_x) max(T_x) min(T_y) max(T_y) min(T_z) max(T_z)];
hold off




