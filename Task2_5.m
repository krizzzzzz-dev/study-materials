%% Task 2.5 (Homework) - Universal Robots UR5e

% ---- Load robot and set column vector format ----
myRobot = loadrobot('universalUR5e');
myRobot.DataFormat = 'column';

% ---- Inspect body/joint names ----
showdetails(myRobot);

% ---- Use interactive tool to find matching pose ----
% Uncomment the line below, drag the robot to match the target image,
% then read the angles from Representation.Configuration
% Representation = interactiveRigidBodyTree(myRobot, 'Frames', 'off');

% ---- Configuration (column vector, 6 joints) ----
% With DataFormat='column', homeConfiguration returns a 6x1 vector
config = homeConfiguration(myRobot);
config(1) = deg2rad(0);     % base rotation
config(2) = deg2rad(-90);   % shoulder
config(3) = deg2rad(90);    % elbow
config(4) = deg2rad(-90);   % wrist 1
config(5) = deg2rad(-90);   % wrist 2
config(6) = deg2rad(0);     % wrist 3

% ---- Visualize ----
figure;
show(myRobot, config);
title('Task 2.5 - Universal Robots UR5e');

% ---- Tool position in base frame ----
% 'tool0' is the end-effector body name in the UR5e model
T = getTransform(myRobot, config, 'tool0');
pos = tform2trvec(T);
disp('Tool position [x, y, z] in meters:');
disp(pos);
