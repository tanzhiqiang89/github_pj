function [th1,th2,th3,th4,th5,th6] = Move_IK(th1,th2,th3,th4,th5,th6,Target)
    global Link
    num=1;
    while 1    
        figure(1);
        DHfk6Dof(th1,th2,th3,th4,th5,th6,0,0);

        J=Jacobian6DoF_Ln(th1,th2,th3,th4,th5,th6);
        x=det(J) ;
        
        err = CalcVWerr(Target, Link(7));
        E = err'*err;
        if E<1e-6
            break
        end
        
        E_tmp = E;
        lambda = 1;
        while E-E_tmp<=0
            dD = lambda*err;
            dth=pinv(J)*dD;  %因为inv是对矩阵求逆，而对于不是可逆矩阵的矩阵求逆就会出错，pinv就是对不是可逆矩阵的矩阵求伪逆。
            th1_tmp=th1+dth(1)/pi*180;
            th2_tmp=th2+dth(2)/pi*180;
            th3_tmp=th3+dth(3)/pi*180;
            th4_tmp=th4+dth(4)/pi*180;
            th5_tmp=th5+dth(5)/pi*180;
            th6_tmp=th6+dth(6)/pi*180;
            
%             th2_tmp=restrain_value(th2_tmp,-180,-180);
%             th3_tmp=restrain_value(th3_tmp,-180,-180);
%             th4_tmp=restrain_value(th4_tmp,10,250);
%             th6_tmp=restrain_value(th6_tmp,0,180);
            
            DHfk6Dof(th1_tmp,th2_tmp,th3_tmp,th4_tmp,th5_tmp,th6_tmp,0,0);
            err = CalcVWerr(Target, Link(7));
            E_tmp = err'*err;
            lambda = lambda/2.0;
        end

        th1=th1_tmp;
        th2=th2_tmp;
        th3=th3_tmp;
        th4=th4_tmp;
        th5=th5_tmp;
        th6=th6_tmp;

        xout(num)=x;
        t(num)=num;
        E_polt(num)=E_tmp;

        if E_tmp<1e-6
            break
        end

        num=num+1;
    end
end

