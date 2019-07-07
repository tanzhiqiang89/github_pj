%这个m是想让6个轴单独动一下
close all;
clear;

global Link

ToDeg = 180/pi;
ToRad = pi/180;

th1=0;
th2=-90;
th3=0;
d4=50;
th5=0;
th6=90;
DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6,0,1);
view(134,12);

pause;
stp=30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for i=0:stp:360
   DHfk6Dof_Workplace(th1+i,th2,th3,d4,th5,th6,1,1);
end
for i=360:-stp:0
   DHfk6Dof_Workplace(th1+i,th2,th3,d4,th5,th6,1,1);
end

for i=0:stp:90
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end
for i=90:-stp:-90
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end
for i=-90:stp:0
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end

for i=0:-stp:-180
   DHfk6Dof_Workplace(th1,th2,th3+i,d4,th5,th6,1,1);
end
for i=-180:stp:0
   DHfk6Dof_Workplace(th1,th2,th3+i,d4,th5,th6,1,1);
end

for i=0:10:200
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end
for i=200:-10:-40
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end
for i=-40:10:0
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end

for i=0:stp:360
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5+i,th6,1,1);
end
for i=360:-stp:0
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5+i,th6,1,1);
end

for i=0:stp:90
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end
for i=90:-stp:-90
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end
for i=-90:stp:0
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end

DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,0,1);
