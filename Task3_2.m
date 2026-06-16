startPosition = [0; pi/4; -pi/2; 0];
targetPosition = [-pi/4; -pi/4; pi/2; pi/6];

wayPoints = [startPosition, targetPosition];
numSamples = 200;

[q, qd, qdd, tSamples, pp] = trapveltraj(wayPoints, numSamples);

figure;
plot(tSamples, q);
title('Task 3.2 - Joint angles');
xlabel('Time (s)');
ylabel('Angle (rad)');
legend('A1', 'A2', 'A3', 'A4');

figure;
plot(tSamples, qd);
title('Task 3.2 - Joint velocities');
xlabel('Time (s)');
ylabel('Velocity (rad/s)');
legend('A1', 'A2', 'A3', 'A4');
