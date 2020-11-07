clc
clear 
close all


dt=0.02;
stime=50;
loop=stime/dt;


% public virtual leadr init
xl=[0;0;0];
vl=[0;0;0];

xyzd = zeros(3,loop);
xyzd_dot = zeros(3,loop);
xyzd_ddot = zeros(3,loop);

sp=1;

for t=1:loop
    
    %leader information generator
    if t/loop<0.1
        al=([0;0;sp]-vl);
    elseif t/loop<0.2
        al=([sp;0;0]-vl);
    elseif t/loop<0.4
        al=([0;sp;0]-vl);
    elseif t/loop<0.6
        al=([-sp;0;0]-vl);
    elseif t/loop<0.8
        al=([0;-sp;0]-vl);
    elseif t/loop<0.9
        al=([sp;0;sp]-vl);
    else
        al=([sp;0;0]-vl);
    end

    vl=vl+dt*al;
    xl=xl+dt*vl;
    
    xyzd(:,t+1) = xl;
    xyzd_dot(:,t+1) = vl;
    xyzd_ddot(:,t+1) = al;
end

ReferenceValue = [xyzd;xyzd_dot;xyzd_ddot];

plot3(xyzd(1,1:2501),xyzd(2,1:2501),xyzd(3,1:2501))
legend('CalvertLee','Location','EastOutside');



