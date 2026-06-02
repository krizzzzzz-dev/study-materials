%% Task 2.2 - Visualize robot with a specific configuration

% Run Task2_1 first to build the robot
run('Task2_1.m');

% Create configuration with theta1 = -30 deg, theta2 = 80 deg
config = homeConfiguration(myRobot);
config(1).JointPosition = deg2rad(-30);
config(2).JointPosition = deg2rad(80);

% Visualize
figure;
show(myRobot, config);
title('Task 2.2 - theta1 = -30 deg, theta2 = 80 deg');
