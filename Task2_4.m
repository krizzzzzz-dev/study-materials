%% Task 2.4 - Load ABB IRB 120 robot and inspect it

% Load the robot model
myRobot = loadrobot('abbIrb120');

% Show joint and body names
showdetails(myRobot);

% Create configuration with given joint angles
config = homeConfiguration(myRobot);
config(1).JointPosition = deg2rad(0);    % A1 = 0 deg
config(2).JointPosition = deg2rad(60);   % A2 = 60 deg
config(3).JointPosition = deg2rad(-30);  % A3 = -30 deg
config(4).JointPosition = deg2rad(0);    % A4 = 0 deg
config(5).JointPosition = deg2rad(45);   % A5 = 45 deg
config(6).JointPosition = deg2rad(-45);  % A6 = -45 deg

% Visualize
figure;
show(myRobot, config);
title('Task 2.4 - ABB IRB 120');

% Get transformation matrix: base -> end effector
T = getTransform(myRobot, config, 'tool0');
disp('Transformation matrix (base -> end effector):');
disp(T);

% Get end effector position in base frame
pos = tform2trvec(T);
disp('End effector position [x, y, z] in meters:');
disp(pos);
