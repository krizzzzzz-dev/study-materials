%% Task 3.2

StartPosition = [0; pi/4; -pi/2; 0];

TargetPosition = [-pi/4; -pi/4; pi/2; pi/6];

wayPoints = [StartPosition, TargetPosition];

numSamples = 200;

[q,qd,qdd,tSamples,pp] = trapveltraj(wayPoints,numSamples);

figure
plot(tSamples,q)
title('Joint Angles')
legend('A1','A2','A3','A4')

figure
plot(tSamples,qd)
title('Joint Velocities')
legend('A1','A2','A3','A4')
