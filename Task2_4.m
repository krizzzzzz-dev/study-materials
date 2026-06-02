%% Task 2.4 - Load ABB IRB 120 and find end effector pose

% ---- Load robot ----
myRobot = loadrobot('abbIrb120');

% ---- Inspect body/joint names ----
showdetails(myRobot);

% ---- Set joint angles ----
config = homeConfiguration(myRobot);
config(1).JointPosition = deg2rad(0);    % A1
config(2).JointPosition = deg2rad(60);   % A2
config(3).JointPosition = deg2rad(-30);  % A3
config(4).JointPosition = deg2rad(0);    % A4
config(5).JointPosition = deg2rad(45);   % A5
config(6).JointPosition = deg2rad(-45);  % A6

% ---- Visualize ----
figure;
show(myRobot, config);
title('Task 2.4 - ABB IRB 120');

% ---- Transformation matrix: base -> tool (end effector) ----
% 'tool0' is the end-effector body name in the abbIrb120 model
T = getTransform(myRobot, config, 'tool0');
disp('Transformation matrix (base -> tool0):');
disp(T);

% ---- Cartesian position ----
pos = tform2trvec(T);
disp('End effector position [x, y, z] in meters:');
disp(pos);
