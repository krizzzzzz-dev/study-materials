%% Task 2.5 (Homework) - Universal Robots UR5e

% Load robot model
myRobot = loadrobot('universalUR5e');

% Use column vector format for joint angles
myRobot.DataFormat = 'column';

% Show body names to know the joint order
showdetails(myRobot);

% Use the interactive tool to explore configurations visually
% Representation = interactiveRigidBodyTree(myRobot, 'Frames', 'off');
% Use right-click -> "Set body as marker body" -> drag to target pose
% Then read: Representation.Configuration

% Example configuration matching the shown pose (adjust angles as needed)
% The UR5e has 6 revolute joints
config = homeConfiguration(myRobot);

% Adjust these values after visually matching the target pose
config(1) = deg2rad(0);    % base
config(2) = deg2rad(-90);  % shoulder
config(3) = deg2rad(90);   % elbow
config(4) = deg2rad(-90);  % wrist 1
config(5) = deg2rad(-90);  % wrist 2
config(6) = deg2rad(0);    % wrist 3

% Visualize
figure;
show(myRobot, config);
title('Task 2.5 - Universal Robots UR5e');

% Get tool position in base frame
T = getTransform(myRobot, config, 'tool0');
pos = tform2trvec(T);
disp('Tool position [x, y, z] in meters:');
disp(pos);
